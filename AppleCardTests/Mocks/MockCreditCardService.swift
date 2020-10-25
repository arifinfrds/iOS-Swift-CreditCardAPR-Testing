//
//  MockCreditCardService.swift
//  AppleCardTests
//
//  Created by Arifin Firdaus on 25/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
@testable import AppleCard

class MockCreditScoreService: ICreditScoreService {
    
    func getCreditScore(user: User, completion: @escaping ((Result<CreditScore, Error>) -> Void)) {
        completion(.success(CreditScore(score: 750)))
    }
    
}
