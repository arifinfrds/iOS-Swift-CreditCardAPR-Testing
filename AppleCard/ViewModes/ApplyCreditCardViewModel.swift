//
//  ApplyCreditCardViewModel.swift
//  AppleCard
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation


class ApplyCreditCardViewModel: ObservableObject {
    var name: String = ""
    var ssn: String = ""
    var dob: String = ""
     
    @Published var message: String = ""
    
    private var user: User {
        return User(name: self.name, ssn: self.ssn, dob: self.dob.toDate())
    }
    
    private let service: ICreditScoreService
    
    init(service: ICreditScoreService) {
        self.service = service
    }
    
    func apply() {
        if !user.isEligible {
            self.message = "Denied: Underage"
            return
        }
        
        let card = CreditCard(user: user)
        card.calculateAPR(service: self.service) {
            DispatchQueue.main.async {
                if let apr = card.apr {
                    self.message = "\(apr)%"
                }
            }
        }
    }
}

