//
//  ApplyCreditCardPage.swift
//  AppleCardUITests
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import XCTest

class ApplyCreditCardPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func fillName(text: String) {
        let nameTextField = app.textFields["nameTextField"]
        nameTextField.tap()
        nameTextField.typeText(text + "\n")
    }
    
    func fillSsn(text: String) {
        let ssnTextField = app.textFields["ssnTextField"]
        ssnTextField.tap()
        ssnTextField.typeText(text + "\n")
    }
    
    func fillDob(dob: String) {
        let dateOfBirthTextField = app.textFields["dobTextField"]
        dateOfBirthTextField.tap()
        dateOfBirthTextField.typeText(dob + "\n")
    }
    
    func tapApplyButton() {
        app.buttons["applyButton"].tap()
    }
    
    func getMessageLabel() -> XCUIElement {
        let messageLabel = app.staticTexts["messageLabel"]
        return messageLabel
        
    }
}
