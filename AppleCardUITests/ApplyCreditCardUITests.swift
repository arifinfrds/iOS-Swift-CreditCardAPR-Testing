//
//  AppleCardUITests.swift
//  AppleCardUITests
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest


class When_Below_18_person_applies_credit_card: XCTestCase {
    private var app: XCUIApplication!
    private var applyCreditCardPage: ApplyCreditCardPage!
    
    override func setUp() {
        self.app = XCUIApplication()
        self.app.launch()
        self.applyCreditCardPage = ApplyCreditCardPage(app: app)
    }
  
    func test_should_show_denined_message_on_label() {
        let name = "Arifin Firdaus"
        let ssn = "123-23-2223"
        let dateOfBirth = "02-12-2019"
        
        applyCreditCardPage.fillName(text: name)
        applyCreditCardPage.fillSsn(text: ssn)
        applyCreditCardPage.fillDob(dob: dateOfBirth)
        
        applyCreditCardPage.tapApplyButton()
        
        let messageLabel = applyCreditCardPage.getMessageLabel()
        
        XCTAssertEqual(messageLabel.label, "Denied: Underage")
    }
}


