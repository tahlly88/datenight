//
//  PlayAudio.swift
//  DateNight
//
//  Created by Michael Gates on 7/1/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playUiSound(sound: String, type: String) {
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.play()
		} catch{
			print("Error playing file!")
		}
	}
}


