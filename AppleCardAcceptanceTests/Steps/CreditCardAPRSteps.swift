//
//  CreditCardAPRSteps.swift
//  AppleCardAcceptanceTests
//
//  Created by Arifin Firdaus on 25/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import Cucumberish
import XCTest

class CreditCardAPRSteps {
    private let app: XCUIApplication
    private let page: ApplyCreditCardPage
    
    init() {
        app = XCUIApplication()
        page = ApplyCreditCardPage(app: app)
    }
    
    func run() {
        Given("following user information applied for credit card") { (args, userInfo) in
            self.app.launch()
            
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
        
        When("When I press the apply button") { (_, _) in
            self.page.tapApplyButton()
        }
        
        Then("I should see my APR rates") { (_, userInfo) in
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            
            for index in 1..<rows.count {
                let data = (rows[index] as! NSArray)
                let apr = data[1] as! String
                
                let isMessageLabelVisible = self.page.getMessageLabel().waitForExistence(timeout: 5.0)
                if isMessageLabelVisible {
                    XCTAssertEqual(apr, self.page.getMessageLabel().label)
                }
                
            }
        }
    }
}
