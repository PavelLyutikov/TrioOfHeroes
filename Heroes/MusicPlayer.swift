//
//  MusicPlayer.swift
//  Elon's Adventure
//
//  Created by mac on 23.10.2020.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import AVFoundation

var walkingSound: AVAudioPlayer!
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
func playWalkingSound(fileName: String) {
    let resourceUrl = Bundle.main.url(forResource: fileName, withExtension: nil)
    guard let url = resourceUrl else {
        print("Could not file: \(fileName)")
        return
    }
    
    do {
        try walkingSound = AVAudioPlayer(contentsOf: url)
        walkingSound.numberOfLoops = -1
        walkingSound.prepareToPlay()
        walkingSound.play()
    } catch {
        print("Could not creat audio player!")
        return
    }
    
}
