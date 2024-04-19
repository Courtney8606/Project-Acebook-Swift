//
//  AuthenticationService.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//
import Foundation
import SwiftUI

class AuthenticationService: AuthenticationServiceProtocol {
    func signUp(user: User) -> Bool {
        // Logic to call the backend API for signing up
        return true // placeholder
    }
    

    func logIn(email: String, password: String, completion: @escaping (String?) -> Void) {
        //To test the functionality below, you can call logIn() in a Playground with a completion handler like this
        //logIn(email:"test@email.com", password:"testPword") { token in
        //    if let token = token {
        //        print("Logged in successfully with token: \(token)")
        //    } else {
        //        print("Login failed")
        //    }
        //
        //    // Stop the Playground execution after receiving the response
        //    PlaygroundPage.current.finishExecution()
        //}
        //
        //You'll need to keep the Playground running until the response is received:
        //import PlaygroundSupport
        //PlaygroundPage.current.needsIndefiniteExecution = true
        
        // URL of backend API endpoint for authorization
        let urlString = "http://localhost:3000/tokens"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String:Any] = ["email":email, "password":password]
        // Serialize the request body to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Error converting parameters to JSON data")
            return
        }
        request.httpBody = jsonData
            

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // Parse the JSON response
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["token"] as? String {
                    // Token retrieved successfully:
                    // Token handling (e.g. storing to some local storage) should be added here
                    // print(token)
                    completion(token)
                } else {
                    print("Invalid JSON format or token not found")
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
            
        }
            task.resume()
    }

}
