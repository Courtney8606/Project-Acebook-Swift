//
//  User.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

import SwiftUI

public struct User:Codable {
    let username: String
    let password: String
}

func getUserInfo(completion: @escaping (User) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
    request.httpMethod = "GET"
    request.setValue("user_id", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            do {
                let userDetails = try JSONDecoder().decode(User.self, from: data)
                print(userDetails)
                completion(userDetails)
            } catch {
                print("error")
            }
        }
    }
}

