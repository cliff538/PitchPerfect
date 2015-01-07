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

    override func viewDidLoad() {
        super.viewDidLoad()
			
			if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
					var filePathUrl = NSURL.fileURLWithPath(filePath)
				
			} else {
				println("The FilePath is empty")
			}

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBOutlet weak var playSlowAudio: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
