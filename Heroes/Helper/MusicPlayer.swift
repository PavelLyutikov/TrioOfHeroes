//
//  MusicPlayer.swift
//  Elon's Adventure
//
//  Created by mac on 23.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import AVFoundation

var bossSound: AVAudioPlayer!
var backgroungMenuMusicPlayer: AVAudioPlayer!
var backgroungGameArcherMusicPlayer: AVAudioPlayer!

//Menu
func playBackgroundMenuMusic(fileName: String) {
    let resourceUrl = Bundle.main.url(forResource: fileName, withExtension: nil)
    guard let url = resourceUrl else {
        print("Could not file: \(fileName)")
        return
    }
    
    do {
        try backgroungMenuMusicPlayer = AVAudioPlayer(contentsOf: url)
        backgroungMenuMusicPlayer.numberOfLoops = -1
        backgroungMenuMusicPlayer.prepareToPlay()
        backgroungMenuMusicPlayer.play()
    } catch {
        print("Could not creat audio player!")
        return
    }
    
}

//Archer
func playBackgroundGameArcherMusic(fileName: String) {
    let resourceUrl = Bundle.main.url(forResource: fileName, withExtension: nil)
    guard let url = resourceUrl else {
        print("Could not file: \(fileName)")
        return
    }
    
    do {
        try backgroungGameArcherMusicPlayer = AVAudioPlayer(contentsOf: url)
        backgroungGameArcherMusicPlayer.numberOfLoops = -1
        backgroungGameArcherMusicPlayer.prepareToPlay()
        backgroungGameArcherMusicPlayer.play()
    } catch {
        print("Could not creat audio player!")
        return
    }
    
}

//Walking
func playBossSound(fileName: String) {
    let resourceUrl = Bundle.main.url(forResource: fileName, withExtension: nil)
    guard let url = resourceUrl else {
        print("Could not file: \(fileName)")
        return
    }
    
    do {
        try bossSound = AVAudioPlayer(contentsOf: url)
        bossSound.numberOfLoops = -1
        bossSound.prepareToPlay()
        bossSound.play()
    } catch {
        print("Could not creat audio player!")
        return
    }
    
}
