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
    
    init(_id:String, message: String, createdAt: String, createdBy: CreatedBy){
      self._id = _id
      self.message = message
      self.createdAt = createdAt
      self.createdBy = createdBy
    }
    
    struct CreatedBy: Decodable { // Add a nested struct for createdBy
        var _id: String
        var username: String
        var profilePicture: String
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
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZjhkMDJhNWVmOTYxODU2ZGMyMjY1IiwiaWF0IjoxNzEzMzQ1ODEyLCJleHAiOjE3MTMzODE4MTJ9.Dyzec-4B8UkBvaTaR8xKOqoqgoAh1km8MuGA9jNdTB4"
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
            let response = try decoder.decode(PostsResponse.self, from: data)
                completion(response.posts)
            } catch {
                print("Error decoding JSON: \(error)")
        }
   
    }
        task.resume()
}




