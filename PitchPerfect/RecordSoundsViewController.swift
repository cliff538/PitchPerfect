//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Cliff Gurske on 1/5/15.
//  Copyright (c) 2015 Cliff Gurske. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

	@IBOutlet weak var recordingInProgress: UILabel!
	@IBOutlet weak var stopButton: UIButton!
	@IBOutlet weak var recordButton: UIButton!
	
	var audioRecorder: AVAudioRecorder!
	var recordedAudio: RecordedAudio!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewWillAppear(animated: Bool) {
		// Hide the stop button
		stopButton.hidden = true
	}

	@IBAction func recordAudio(sender: UIButton) {
		
		// Show the stop button
		stopButton.hidden = false
		recordingInProgress.hidden = false
		// Disable the record button to prevent hitting it twice.
		recordButton.enabled = false
		
		// Record the user's voice
		
		let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
		
		let currentDateTime = NSDate()
		let formatter = NSDateFormatter()
		formatter.dateFormat = "ddMMyyyy-HHmmss"
		let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
		let pathArray = [dirPath, recordingName]
		let filePath = NSURL.fileURLWithPathComponents(pathArray)
		println(filePath)
		
		// Setup Audio Session.
		var session = AVAudioSession.sharedInstance()
		session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
		
		// Initialize and prepare the recorder.
		audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
		audioRecorder.delegate = self		// initializes the AVAudioRecorderDelegate to our var audioRecorder. Allows us to use all the methods built into AVaudioRecorder.
		audioRecorder.meteringEnabled = true
		audioRecorder.prepareToRecord()
		audioRecorder.record()
	}
	
	func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
		
		if(flag) {
		
			//TODO: Save the recorded audio
			recordedAudio = RecordedAudio()
			recordedAudio.filePathURL = recorder.url
			recordedAudio.title = recorder.url.lastPathComponent
		
			//TODO: Move to the next scene, aka perform seque
			self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
			
		}else{
				println("Recording was not successful")
				recordButton.enabled = true
				stopButton.hidden = true
		}
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if (segue.identifier == "stopRecording") {
			let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
			let data = sender as RecordedAudio 
		}
	}
	
	@IBAction func stopAudio(sender: UIButton) {
		
		recordingInProgress.hidden = true
		
		// Stop recording the user's voice.
		
		audioRecorder.stop()
		var audioSession = AVAudioSession.sharedInstance()
		audioSession.setActive(false, error: nil)
	}
	

}

	