//
//  UserTests.swift
//  AppleCardTests
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import AppleCard

class When_18_or_above_person_applies_credit_card: XCTestCase {
    
    func test_should_make_sure_user_is_eligible() {
        let dob = Calendar.current.date(byAdding: .year, value: -20, to: Date())
        let user = User(name: "Arifin Firdaus", ssn: "123-22-1233", dob: dob!)
        XCTAssertTrue(user.isEligible)
    }

}

class When_Below_18_person_applies_credit_card: XCTestCase {
    
    func test_should_make_sure_user_is_denied() {
        let dob = Calendar.current.date(byAdding: .year, value: -1, to: Date())
        let user = User(name: "Arifin Firdaus", ssn: "123-22-1233", dob: dob!)
        XCTAssertFalse(user.isEligible)
    }
    
}
