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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
			var filePathUrl = NSURL.fileURLWithPath(filePath)
			audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil) // audioPlayer initilized here.
			audioPlayer.enableRate = true
			
		} else {
			println("The FilePath is empty")
		}
		
		// Do any additional setup after loading the view.
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
