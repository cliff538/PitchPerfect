//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Cliff Gurske on 1/5/15.
//  Copyright (c) 2015 Cliff Gurske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var recordingInProgress: UILabel!
	@IBOutlet weak var stopButton: UIButton!
	@IBOutlet weak var recordButton: UIButton!
	
	
	
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
		
		// Disable the record button to prevent hitting it twice.
		recordButton.enabled = false
		
		// Show the stop button
		stopButton.hidden = false
		
		//TODO: Show text "recording in progress"
		recordingInProgress.hidden = false
		
		//TODO: Record the user's voice
		
		println("in recordAudio")
	}

}

	