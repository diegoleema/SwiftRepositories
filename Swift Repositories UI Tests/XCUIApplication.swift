//
//  XCUIApplication.swift
//  Swift Repositories UI Tests
//
//  Created by Diego Lima on 12/10/20.
//

import Foundation

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
        return otherElements["onboardingView"].exists
    }
}
