//
//  SimpleAlertTests.swift
//  SimpleAlertTests
//
//  Created by doug harper on 11/5/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import XCTest
@testable import SimpleAlert

class SimpleAlertTests: XCTestCase {
    
    /// get a handle on the storyboard object
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    /// sut = "system under test"
    var sut: ViewController!
    
    /// the setUp function gets called before each test executes, so you can start each test with a clean slate.
    override func setUp() {
        super.setUp()

        /// instantiate the view controller from the storyboard. make sure you set the Storyboard ID equal to whatever string you want, typically the same name as the class. in this case, "ViewController".
        sut = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        /// add our sut to the sharedApp's keyWindow as the rootViewController, so that you can test the UIAlertController presents properly, or other segues, too. Not necessary if you're not testing navigation or presentation.
        UIApplication.sharedApplication().keyWindow!.rootViewController = sut
        
        /// calling sut.view initiates loading the view hierarchy, hooking up outlets, and such. viewDidLoad gets executed, but not viewWillAppear, viewDidAppear, etc.
        _ = sut.view
    }
    
    
    // MARK: test outlets are connected
    func testTimerLabelShouldBeConnected() {
        XCTAssertNotNil(sut.timerLabel)
    }
    
    
    // MARK: test initial values
    func testSecondsHasValue() {
        XCTAssertEqual(sut.seconds, 60)
        // ...remember this is because you set it to 0 initially, but when we call sut.view in our setUp function, it immediately gets assigned 60.
    }
    
    func testTimerInitiallyHas60Seconds() {
        XCTAssertEqual(sut.timer.timeInterval, 1)
    }
    
    
    // MARK: test actions produce proper behaviors/results
    func testSubtractTimeShouldDecreaseSecondsBy1() {
        // given
        // `seconds` is initialized to 60, so we don't need to set any initial state
        
        // when
        sut.subtractTime()
        
        // then
        XCTAssertEqual(sut.seconds, 59)
    }
    
    func testSubtractTimeAt0SecondsShouldInvalidateTimer() {
        // given
        sut.seconds = 1
        
        // when
        sut.subtractTime()
        
        // then
        XCTAssertEqual(sut.seconds, 0)
        XCTAssertFalse(sut.timer.valid)
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
    }
    
    func testAlertControllerProperties() {
        // given
        sut.seconds = 1
        
        // when
        sut.subtractTime()
        
        // then
        let alertController = sut.presentedViewController as! UIAlertController
        XCTAssertEqual(alertController.title, "Please Update Your License")
        XCTAssertNil(alertController.message)
        print("actions: \(alertController.actions)")
    }
    
}
