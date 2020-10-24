//
//  String+Date.swift
//  AppleCard
//
//  Created by Arifin Firdaus on 24/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yyy"
        return dateFormatter.date(from: self)!
    }
}
