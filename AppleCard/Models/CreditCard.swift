//
//  CreditCard.swift
//  AppleCard
//
//  Created by Arifin Firdaus on 25/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class CreditCard {
    var user: User
    var apr: Double?
    
    init(user: User) {
        self.user = user
    }
    
    func calculateAPR(service: ICreditScoreService, completion: @escaping (() -> Void)) {
        service.getCreditScore(user: self.user) { result in
            switch result {
            case .success(let creditScore):
                switch creditScore.score {
                case 600..<700:
                    self.apr = 0.2
                case 700..<850:
                    self.apr = 0.06
                default:
                    self.apr = nil
                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
