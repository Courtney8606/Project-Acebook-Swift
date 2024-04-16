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

//func getUserInfo(completion: @escaping (User) -> Void) {
//    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
//    request.httpMethod = "GET"
//    request.setValue("user_id", forHTTPHeaderField: "Authorization")
//    
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let data = data {
//            do {
//                let userDetails = try JSONDecoder().decode(User.self, from: data)
//                print(userDetails)
//                completion(userDetails)
//            } catch {
//                print("error")
//            }
//        }
//    }
//}

func getUserInfo(completion: @escaping (User) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
    request.httpMethod = "GET"
    
    // Set the Header values, which is the token to authenticate the session
    let token = "" // Replace this with your actual token you received back from logging in / getting all posts and stored
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            do {
                let userDetails = try JSONDecoder().decode(User.self, from: data)
                // If it decodes successfully, print it out so you can see it in the console
                print(userDetails)
                completion(userDetails)
            } catch {
                let responseString = String(data: data, encoding: .utf8) ?? "Could not decode data"
                   // If something goes wrong, print out the response string so we can see what the data looks like. We have to translate to a String to be able to read it (and not just see xx bytes)
                print("Received data: \(responseString)")
                // This error will give us more information
                print("Error decoding data: \(error)")
            }
        } else if let error = error {
            print("Network error: \(error)")
        }
    }
    task.resume()
}
