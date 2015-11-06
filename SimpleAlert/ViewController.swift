//
//  ViewController.swift
//  SimpleAlert
//
//  Created by doug harper on 11/4/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 0
    var timer = NSTimer()
    
    /** Start timer when the view loads **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerSetUp()
    }

    /** Setup timer. Start at 60, update timerLabel, set timer for 1 second **/
    func timerSetUp() {
        
        seconds = 60
        
        timerLabel.text = "\(seconds)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
    }
    
    /** Subtract time & update TimerLabel.  Stop timer and fire off an alert message when seconds reaches 0 **/
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if (seconds) == 0 {
            timer.invalidate()
            
            let alert = UIAlertController(title: "Please Update Your License", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Enter License", style: .Default, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
}

