//
//  PostNewUser.swift
//  MobileAcebook
//
//  Created by kevin eboda on 17/04/2024.
//

import Foundation

func postNewUser (user: User, completion: @escaping (Result<User, Error>) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
  
    request.httpMethod = "POST"
    
    //convert user details to json
    do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            //completion(.failure(error))
            return
        }
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            // completion(.failure(error))
            print("Error: \(error)")
            return
        }//error
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid HTTP response")
            return
                }//guard
        if (200..<300).contains(httpResponse.statusCode) {
            print("User successfully posted")
            } else {
                print("Failed to post user. Status code: \(httpResponse.statusCode)")
                    }
        
    }//task
    
    task.resume()
}//function


