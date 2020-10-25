//
//  CreditCardTests.swift
//  AppleCardTests
//
//  Created by Arifin Firdaus on 25/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import AppleCard

class When_calculating_APR_based_on_credit_score: XCTestCase {
    
    func test_should_calculate_apr_successfully() {
        // given
        let user = User(name: "Arifin Firdaus", ssn: "123-45-222", dob: "02-05-1975".toDate())
        let card = CreditCard(user: user)
        
        let expectation = self.expectation(description: "Credit Score has been loaded..")
        let service = MockCreditScoreService()
        
        // when
        card.calculateAPR(service: service) {
            XCTAssertEqual(0.06, card.apr)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
        // then
    }
    
}
