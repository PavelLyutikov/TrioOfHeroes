//
//  AppDelegate.swift
//  Heroes
//
//  Created by mac on 14.11.2020.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if !UserDefaults.standard.bool(forKey: "isFirstOpen") {
            
            UserDefaults.standard.set(0, forKey: "showAddInterstitial")
            UserDefaults.standard.set(false, forKey: "successfulPurchaseRemoveAds")
            
            UserDefaults.standard.set(true, forKey: "backgroundMusic")
            UserDefaults.standard.set(true, forKey: "sound")
            UserDefaults.standard.set(true, forKey: "vibration")
            
            UserDefaults.standard.set(false, forKey: "menuMusicOn")
            
            UserDefaults.standard.set(false, forKey: "bonusJump")
            UserDefaults.standard.set(0, forKey: "bonusJumpScore")
            UserDefaults.standard.set(false, forKey: "noMoreBonusJump")
            UserDefaults.standard.set(false, forKey: "buyAnotherBonus")
            
            UserDefaults.standard.set("archerSkin1", forKey: "archerSkin")
           } else {
            UserDefaults.standard.set(false, forKey: "menuMusicOn")
           }
        UserDefaults.standard.set(true, forKey: "isFirstOpen")
        
        UserDefaults.standard.set(0, forKey: "levelNumber")
        
        
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removePause"), object: nil)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pauseGame"), object: nil)
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

