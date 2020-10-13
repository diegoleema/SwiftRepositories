//
//  Swift_Repositories_UI_Tests.swift
//  Swift Repositories UI Tests
//
//  Created by Diego Lima on 12/10/20.
//

import XCTest
@testable import Swift_Repositories

class Swift_Repositories_UI_Tests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchAndDiplay() throws {
        app.launch()
        XCTAssertTrue(app.otherElements["onboardingView"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
