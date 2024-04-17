//
//  GetUserInfo.swift
//  MobileAcebook
//
//  Created by Patrick Skipworth on 17/04/2024.
//

import Foundation

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
