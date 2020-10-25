//
//  CreditScoreService.swift
//  AppleCard
//
//  Created by Arifin Firdaus on 25/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

protocol ICreditScoreService {
    func getCreditScore(
        user: User,
        completion: @escaping ((Result<CreditScore, Error>) -> Void)
    )
}

class CreditScoreService: ICreditScoreService {
    func getCreditScore(
        user: User,
        completion: @escaping ((Result<CreditScore, Error>) -> Void)
    ) {
        guard let url = URL(string: "https://hissing-polarized-starfish.glitch.me/credit-score") else {
            fatalError("URL is not defined")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(["ssn": user.ssn])
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: NSURLErrorDomain, code: -1, userInfo: nil)))
                return
            }
            let creditScore = try! JSONDecoder().decode(CreditScore.self, from: data)
            completion(.success(creditScore))
        }
        .resume()
        
    }
}

