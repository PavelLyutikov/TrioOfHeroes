//
//  GameViewController.swift
//  Heroes
//
//  Created by mac on 14.11.2020.
//

import UIKit
import SpriteKit
import GameplayKit
import StoreKit
import AppTrackingTransparency

class GameViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    let totalSize = UIScreen.main.bounds.size
    
    var showVideoReward: Bool = false
    var setupVideoReward: Bool = false
    var showVideoRewardCoinX2: Bool = false
    var setupVideoRewardCoinX2: Bool = false
    
    var activityIndicator = UIActivityIndicatorView()
    var numberPurchase: Int = 0
    
    //ironSource
    let kAPPKEY = "123085135"
    var bannerView: ISBannerView! = nil
    
    private let productID = "com.trioOfHeroes.game.removeAds"
    private let productID1000Coin = "com.trioOfHeroes.game.1000Coin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if #available(iOS 11.0, *) {
                if let scene = MenuScene(fileNamed: "MenuScene") {
                    
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }
            } else {
                // Fallback on earlier versions
            }
            
            view.ignoresSiblingOrder = false
        }
        
        //Tracking
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
        if #available(iOS 14.6, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .notDetermined:
                    break
                case .restricted:
                    break
                case .denied:
                    break
                case .authorized:
                    print("authorized")
                    break
                @unknown default:
                    break
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.restorePerchases), name: NSNotification.Name(rawValue: "restorePurchases"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.requestPurchase), name: NSNotification.Name(rawValue: "requestPurchase"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.request1000Coin), name: NSNotification.Name(rawValue: "request1000Coin"), object: nil)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.presentInterstitial), name: NSNotification.Name(rawValue: "presentInterstitial"), object: nil)
        
        
        setupActivityIndicator()
        view.addSubview(activityIndicator)
        
        setupIronSourceSdk()
        loadBanner()
        loadInterstitial()
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.showRewardVideo), name: NSNotification.Name(rawValue: "showRewardVideo"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.showRewardVideoCoinX2), name: NSNotification.Name(rawValue: "showRewardVideoCoinX2"), object: nil)
    }
    
//MARK: - IronSource
    func loadInterstitial() {
        IronSource.loadInterstitial()
    }
    func loadBanner() {
        let BNSize: ISBannerSize = ISBannerSize(description: "BANNER", width: 320 , height: 50)
        IronSource.loadBanner(with: self, size: BNSize)
    }
    func setupIronSourceSdk() {
        
        IronSource.setRewardedVideoDelegate(self)
        IronSource.setInterstitialDelegate(self)
        IronSource.setBannerDelegate(self)
        IronSource.add(self)
        
        IronSource.initWithAppKey(kAPPKEY)
    }
    func logFunctionName(string: String = #function) {
        print("IronSource Swift Demo App:"+string)
    }
    func destroyBanner() {
        if bannerView != nil {
            IronSource.destroyBanner(bannerView)
        }
    }

    //ShowAds
    @objc func presentInterstitial() {
        IronSource.showInterstitial(with: self)
    }
    
//MARK: - ShowRewardVideo
    @objc func showRewardVideo() {
        IronSource.showRewardedVideo(with: self)
        
        setupVideoReward = true
        
        print("showRewardVideo")
        print("setupVideoReward = true")
    }
    @objc func showRewardVideoCoinX2() {
        IronSource.showRewardedVideo(with: self)
        
        setupVideoRewardCoinX2 = true
        print("showRewardVideoCoinX2")
        print("setupVideoRewardCoinX2 = true")
    }
    
//MARK: - Purchase
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased :
                self.successfulPurchase()
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                self.successfulPurchase()
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .failed:
                guard let  error = transaction.error as? SKError else { return }
                
                if error.code == SKError.paymentCancelled {
                    activityIndicator.stopAnimating()
                    self.showAlert("Purchase was cancelled", isError: false)
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            default:
                break
            }
        }
    }
    @objc(productsRequest:didReceiveResponse:) func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        var validProduct: SKProduct? = nil
        let count = Int(response.products.count)
        
        if count > 0 {
            validProduct = response.products[0]
            self.purchase(validProduct!)
        } else if validProduct == nil {
            activityIndicator.stopAnimating()
            self.showAlert("An error occurred while making a purchase", isError: true)
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transactions in queue.transactions {
            if transactions.transactionState == .restored {
                self.successfulPurchase()
                SKPaymentQueue.default().finishTransaction(transactions)
                break
            }
        }
    }
//MARK: - SuccessfulPurchase
    func successfulPurchase() {
        activityIndicator.stopAnimating()
        
        if numberPurchase == 1 {
            
            UserDefaults.standard.set(true, forKey: "successfulPurchaseRemoveAds")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updatePurchaseRemoveAds"), object: nil)
            
        } else if numberPurchase == 2 {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "successfulPurchase1000Coin"), object: nil)
        }
    }
//MARK: - Alert
    func showAlert(_ message: String, isError: Bool) {
        let alert = UIAlertController(title: isError ? "Error" : "Info", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func purchase(_ product: SKProduct) {
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
    }
//MARK: - RequestPurchase
    @objc func requestPurchase() {
        activityIndicator.startAnimating()
        
        numberPurchase = 1
        
        if SKPaymentQueue.canMakePayments() {
            let productsReques = SKProductsRequest(productIdentifiers: [productID])
            productsReques.delegate = self
            
            productsReques.start()
            
        } else {
            activityIndicator.stopAnimating()
            self.showAlert("Purchase error, please try again later", isError: true)
        }
    }
    
//MARK: - RestorePerchases
    @objc func restorePerchases() {
        activityIndicator.startAnimating()
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
//MARK: - Request1000Coin
    @objc func request1000Coin() {
        activityIndicator.startAnimating()
        
        numberPurchase = 2
        
        if SKPaymentQueue.canMakePayments() {
            let productsReques = SKProductsRequest(productIdentifiers: [productID1000Coin])
            productsReques.delegate = self
            
            productsReques.start()
        } else {
            activityIndicator.stopAnimating()
            self.showAlert("Purchase error, please try again later", isError: true)
        }
    }
    
//MARK: - Indicator
    private func setupActivityIndicator(){
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        activityIndicator.center = self.view.center
        activityIndicator.style = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = .darkGray
        activityIndicator.layer.cornerRadius = 20
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}


//MARK: - ExtensionIronSource
extension GameViewController: ISBannerDelegate, ISImpressionDataDelegate, ISInterstitialDelegate, ISRewardedVideoDelegate {
    
    //banner
    func bannerDidLoad(_ bannerView: ISBannerView!) {
        self.bannerView = bannerView
        if #available(iOS 11.0, *) {

            if totalSize.height >= 801 {
                bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.width/2 , y: 0, width: view.frame.size.width, height: 0)

            } else if totalSize.height <= 800 {
                bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.width/2, y: 0, width: view.frame.size.width, height: 0)
            }
        } else {
                bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.width/2, y: 0, width: view.frame.size.width, height: 0)
        }

        bannerView.layer.zPosition = 100
//        view.addSubview(bannerView)

        logFunctionName()
    }
    func bannerDidShow() {
        logFunctionName()
    }
    func bannerDidFailToLoadWithError(_ error: Error!) {
        logFunctionName(string: #function+String(describing: Error.self))
    }
    func didClickBanner() {
        logFunctionName()
    }
    func bannerWillPresentScreen() {
        logFunctionName()
    }
    func bannerDidDismissScreen() {
        logFunctionName()
    }
    func bannerWillLeaveApplication() {
        logFunctionName()
    }
    func impressionDataDidSucceed(_ impressionData: ISImpressionData!) {
        logFunctionName(string: #function+String(describing: impressionData))
    }
    
    //Interstitial
    public func didClickInterstitial() {
        logFunctionName()
    }
    public func interstitialDidFailToShowWithError(_ error: Error!) {
        logFunctionName(string: String(describing: error.self))
    }
    public func interstitialDidShow() {
        logFunctionName()
    }
    public func interstitialDidClose() {
        logFunctionName()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "interstitialDidClose"), object: nil)
    }
    public func interstitialDidOpen() {
        logFunctionName()
    }
    public func interstitialDidFailToLoadWithError(_ error: Error!) {
        logFunctionName(string: #function+String(describing: error.self))
    }
    public func interstitialDidLoad() {
        logFunctionName()
    }
    
    //RewardedVideo
    public func rewardedVideoHasChangedAvailability(_ available: Bool) {
        logFunctionName(string: #function+String(available.self))
    }
    public func rewardedVideoDidEnd() {
        logFunctionName()
    }
    public func rewardedVideoDidStart() {
        logFunctionName()
    }
    public func rewardedVideoDidClose() {
        
        if showVideoReward == true {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "increaseNumberCoins"), object: nil)
            
            print("increaseNumberCoins")
            showVideoReward = false
            setupVideoReward = false
        }
    
        if showVideoRewardCoinX2 == true {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "increaseNumberCoinsX2"), object: nil)
            
            print("increaseNumberCoinsX2")
            showVideoRewardCoinX2 = false
            setupVideoRewardCoinX2 = false
        }
        
        logFunctionName()
    }
    public func rewardedVideoDidOpen() {
        logFunctionName()
    }
    public func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        logFunctionName(string: #function+String(describing: error.self))
    }
    public func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {
        logFunctionName(string: #function+String(describing: placementInfo.self))
        
        if setupVideoReward == true {
            showVideoReward = true
            
            print("showVideoReward = true")
        }
        
        if setupVideoRewardCoinX2 == true {
            showVideoRewardCoinX2 = true
            print("showVideoRewardCoinX2 = true")
        }
        
    }
    func didClickRewardedVideo(_ placementInfo: ISPlacementInfo!) {
        logFunctionName(string: #function+String(describing: placementInfo.self))
    }
}
