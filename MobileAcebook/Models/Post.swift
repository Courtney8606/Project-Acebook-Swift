//
//  Post.swift
//  MobileAcebook
//
//  Created by Rachel Turrell on 15/04/2024.
//

import Foundation
import SwiftUI

class Post: Decodable {
    var _id: String
    var message: String
    var createdAt: String
    var createdBy: CreatedBy
    
    struct CreatedBy: Decodable { // Add a nested struct for createdBy
        var _id: String
        var username: String
        var profilePicture: String
    }
        
    init(_id:String, message: String, createdAt: String, createdBy: CreatedBy){
      self._id = _id
      self.message = message
      self.createdAt = createdAt
        self.createdBy = createdBy
    }
    
        
    func constructedPost() -> String {
      return "Post(\(self._id), \"\(self.message)\", \"\(self.createdAt)\")"
    }
  }

    struct PostsResponse: Decodable {
        let posts: [Post]
        let token: String
    }


func getPosts(completion: @escaping ([Post]) -> Void) {
    var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZDUyNjJlMjFmMDZmNWI1M2FiNTQ1IiwiaWF0IjoxNzEzMzUwMzk1LCJleHAiOjE3MTMzODYzOTV9.QjuLRc9oIYh_C-0odTWXVkzURYLhh0YSriARYE5XvcA"
    request.httpMethod = "GET"
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//    request.setValue("661d5262e21f06f5b53ab545", forHTTPHeaderField: "user_id")
    
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
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let response = try decoder.decode(PostsResponse.self, from: data)
                completion(response.posts)
            } catch {
                print("Error decoding JSON: \(error)")
        }
   
    }
        task.resume()
}

func createPost(message: String, completion: @escaping ([Post]) -> Void) {
            var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
            let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZjhkMDJhNWVmOTYxODU2ZGMyMjY1IiwiaWF0IjoxNzEzMzQ5NzY5LCJleHAiOjE3MTMzODU3Njl9.0rnGNiAZqEk3XvIn-fKeANhYU-4mClRZtvX3UEPy3DE"
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters: [String:Any] = ["message":message]
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                print("Error converting parameters to JSON data")
                return
            }
            request.httpBody = jsonData
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
            }
                task.resume()
        }
