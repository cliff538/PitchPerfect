//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Cliff Gurske on 1/6/15.
//  Copyright (c) 2015 Cliff Gurske. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
	
	var audioPlayer:AVAudioPlayer!   // var audioPlayer is being declared here.
	var receivedAudio:RecordedAudio!
	
	var audioEngine:AVAudioEngine!
	var audioFile:AVAudioFile!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
// The code block below was for playing the movie quote file for testing. Original movie_quote file left in Supporting Files Folder. 
//		if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//			var filePathUrl = NSURL.fileURLWithPath(filePath)
//			
//			
//		} else {
//			println("The FilePath is empty")
//		}
		
		audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil) // audioPlayer initilized here.
		audioPlayer.enableRate = true
		
		audioEngine = AVAudioEngine()
		audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
		
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@IBAction func playSlowAudio(sender: UIButton) {
		
		audioPlayer.stop() // Good practice to stop it before you play it.
		audioPlayer.currentTime = 0.0
		audioPlayer.rate = 0.5 // The range is 0.5 to 2.0 with 1.0 being normal speed. 
		audioPlayer.play() // audioPlayer used here.
	}
	
	@IBAction func playFastAudio(sender: UIButton) {
		
		audioPlayer.stop()
		audioPlayer.currentTime = 0.0
		audioPlayer.rate = 2.0
		audioPlayer.play()
		
	}
	
	@IBAction func playChipmunkAudio(sender: UIButton) {
		
			playAudioWithVariablePitch(1000)
	}
	
	
	func playAudioWithVariablePitch(pitch: Float) {
		
		audioPlayer.stop()
		audioEngine.stop()
		audioEngine.reset()
			
		var audioPlayerNode = AVAudioPlayerNode()
		audioEngine.attachNode(audioPlayerNode)
			
		var changePitchEffect = AVAudioUnitTimePitch()
		changePitchEffect.pitch = pitch
		audioEngine.attachNode(changePitchEffect)
			
		audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
		audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
			
		audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
		audioEngine.startAndReturnError(nil)
			
		audioPlayerNode.play()
	}
		
	@IBAction func playDarthvaderAudio(sender: UIButton) {
		
		playAudioWithVariablePitch(-1000)
	}
	
	
	@IBAction func stopAudio(sender: UIButton) {
		
		audioPlayer.stop()
	}
	
	
	
	
	
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
