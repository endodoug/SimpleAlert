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
    
    let simpleAlert = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSecondsHasValue() {
        XCTAssert(simpleAlert.seconds >= 0)
    }
    
    func testUIAlertViewShowsAfterSecondsReachesZero() {
        
    }
    
}
