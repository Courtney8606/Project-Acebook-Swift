//
//  User.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

import UIKit
import Foundation
import SwiftUI

class User: Decodable {
    var _id: String
    var email: String
//    var password: String
    var username: String
    init(_id: String, email: String, password: String, username: String) {
        self._id = _id
        self.email = email
//        self.password = password
        self.username = username
    }
    func constructedUser() -> String {
        return "User(\(self._id), \"\(self.email)\",  \"\(self.username)\")"
//        If adding password info, add \"\(self.password)\",
    }
    
}

    public struct GetUserResponse: Decodable {
        let userData: [User]
        let token: String
    }
    
func getUserInfo(completion: @escaping (User) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
    // Set the Header values, which is the token to authenticate the session
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZTQ0YWE5ZGRjNmQ4ZTVjZDZiYmU5IiwiaWF0IjoxNzEzMzQ5NTE3LCJleHAiOjE3MTMzNTAxMTd9.qBV4FeLspNT2rXu8lGO0TPdQWCTfxfmnb2t6fKdZ-fI" // Replace this with your actual token you received back from logging in / getting all posts and stored
    request.httpMethod = "GET"
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            return
        }
        guard let data = data else {
            print("No data received")
            return
        }
        print("Received data:", String(data: data, encoding: .utf8) ?? "")
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(GetUserResponse.self, from: data)
            // If it decodes successfully, print it out so you can see it in the console
            if let firstUser = response.userData.first {
                completion(firstUser)
            }
            } catch {
                print("Error decoding JSON: \(error)")
            }
    }
    task.resume()
}
