//
//  PlaySound.swift
//  Waves
//
//  Created by NazarStf on 29.07.2023.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(name: String, type: String) {
	if let path = Bundle.main.path(forResource: name, ofType: type) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.play()
		} catch {
			print("Could not find and play the sound file!")
		}
	}
}
