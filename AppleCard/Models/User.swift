//
//  User.swift
//  AppleCard
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var ssn: String
    var dob: Date
}

extension User {
    var isEligible: Bool {
        let components = Calendar.current.dateComponents([.year], from: dob, to: Date())
        if let year = components.year {
            if year >= 18 {
                return true
            }
        }
        return false
    }
}
