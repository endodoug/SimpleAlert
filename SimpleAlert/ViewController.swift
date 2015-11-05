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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timerSetUp() {
        seconds = 60
        
        timerLabel.text = "Time: \(seconds)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "Time: \(seconds)"
        
        if (seconds) == 0 {
            print("we reached 0")
            timer.invalidate()
            
            let alert = UIAlertController(title: "Please Update Your License", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Enter License", style: .Default, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
}

