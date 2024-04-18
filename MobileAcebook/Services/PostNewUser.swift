//
//  PostNewUser.swift
//  MobileAcebook
//
//  Created by kevin eboda on 17/04/2024.
//

import Foundation

func postNewUser (user: User, completion: @escaping (Result<Int, Error>) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/users")!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    print("postNewUser is called")
    //convert user details to json
    do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            print("Error: \(error)")
            return
        }//error
        enum NetworkError: Error {
            case noData
            case invalidStatusCode
            // Add more cases as needed
        }
        enum PostUserResult {
            case success(statusCode: Int)
            case failure(Error)
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid HTTP response")
            return
                }//guard
        guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
        if (200..<300).contains(httpResponse.statusCode) {
            print("User successfully posted")
            print("Status Code: \(httpResponse.statusCode)")
            completion(.success(httpResponse.statusCode))
            } else {
                print("Failed to post user. Status code: \(httpResponse.statusCode)")
                    }
        do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                } catch {
                    completion(.failure(error))
                }
        
        completion(.success(httpResponse.statusCode))
    }//task
    
    task.resume()
}//function


