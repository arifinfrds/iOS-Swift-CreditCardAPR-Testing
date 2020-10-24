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
    private let app: XCUIApplication
    private let page: ApplyCreditCardPage
    
    init() {
        app = XCUIApplication()
        page = ApplyCreditCardPage(app: app)
    }
    
    func run() {
        Given("the following user information") { (args, userInfo) in
            XCUIApplication().launch()
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            for index in 1..<rows.count {
                let data = (rows[index] as! NSArray)
                let name = data[0] as! String
                let ssn = data[1] as! String
                let dateOfBirth = data[2] as! String
                
                self.page.fillName(text: name)
                self.page.fillSsn(text: ssn)
                self.page.fillDob(dob: dateOfBirth)
            }
            
        }
        
        When("I press the apply button") { (_, _) in
            self.page.tapApplyButton()
        }
        
        Then("I should get a rejection message") { (_, _) in
            let messageLabel = self.page.getMessageLabel()
            XCTAssertEqual(messageLabel.label, "Denied: Underage")
        }
    }
}
