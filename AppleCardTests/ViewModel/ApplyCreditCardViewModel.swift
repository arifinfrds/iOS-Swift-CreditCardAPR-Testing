//
//  ApplyCreditCardViewModel.swift
//  AppleCardTests
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import AppleCard

class When_credit_card_is_denied_due_to_age: XCTestCase {

    func should_set_under_age_message_successfully() {
        // given
        let sut = ApplyCreditCardViewModel()
        sut.name = "Arifin Fidaus"
        sut.ssn = "123-45-5678"
        sut.dob = "02-03-2017"
        
        // when
        sut.apply()
        
        // then
        XCTAssertEqual(sut.message, "Denied: Underage")
        
    }
    
}
