//
//  AppleCardUITests.swift
//  AppleCardUITests
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest


class When_Below_18_person_applies_credit_card: XCTestCase {
  
    func test_should_show_denined_message_on_label() {
        let app = XCUIApplication()
        app.launch()
        
        let name = "Arifin Firdaus"
        let ssn = "123-23-2223"
        let dateOfBirth = "02-12-2019"
        
        let nameTextField = app.textFields["nameTextField"]
        nameTextField.tap()
        nameTextField.typeText(name + "\n")
        
        let ssnTextField = app.textFields["ssnTextField"]
        ssnTextField.tap()
        ssnTextField.typeText(ssn + "\n")
        
        let dateOfBirthTextField = app.textFields["dobTextField"]
        dateOfBirthTextField.tap()
        dateOfBirthTextField.typeText(dateOfBirth + "\n")
        
        
        app.buttons["applyButton"].tap()
        
        
        let messageLabel = app.staticTexts["messageLabel"]
        
        XCTAssertEqual(messageLabel.label, "Denied: Underage")
    }
}


