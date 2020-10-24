//
//  UnderAgeApplyingCardSteps.swift
//  AppleCardAcceptanceTests
//
//  Created by Arifin Firdaus on 23/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import Cucumberish
import XCTest

class UnderAgeApplyingCardSteps {
    
    func run() {
        Given("the following user information") { (args, userInfo) in
            XCUIApplication().launch()
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            for index in 1..<rows.count {
                let data = (rows[index] as! NSArray)
                let name = data[0] as! String
                let ssn = data[1] as! String
                let dateOfBirth = data[2] as! String
                
                let nameTextField = XCUIApplication().textFields["nameTextField"]
                nameTextField.tap()
                nameTextField.typeText(name + "\n")
                
                let ssnTextField = XCUIApplication().textFields["ssnTextField"]
                ssnTextField.tap()
                ssnTextField.typeText(ssn + "\n")
                
                let dateOfBirthTextField = XCUIApplication().textFields["dobTextField"]
                dateOfBirthTextField.tap()
                dateOfBirthTextField.typeText(dateOfBirth + "\n")
            }
            
        }
        
        When("I press the apply button") { (_, _) in
            XCUIApplication().buttons["applyButton"].tap()
        }
        
        Then("I should get a rejection message") { (_, _) in
            let messageLabel = XCUIApplication().staticTexts["messageLabel"]
            XCTAssertEqual(messageLabel.label, "Denied: underage")
        }
    }
}
