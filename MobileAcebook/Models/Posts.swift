//
//  Posts.swift
//  MobileAcebook
//
//  Created by Courtney Suhr on 17/04/2024.
//

import Foundation

import Foundation

class PostStore: ObservableObject {
    
    @Published var posts: [Post] = []
    
    struct PostsResponse: Decodable {
        let posts: [Post]
        let token: String
    }
    
    func getPosts(completion: @escaping ([Post], Error?) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYyMjRlMTIwYzBlNjNhYmRhMTUxNzNlIiwiaWF0IjoxNzEzNTI0Mjg4LCJleHAiOjE3MTM1NjAyODh9.AHPliMxJMeavoJa8_uWycgY-LNhLGh0-VC-Y2-vIrLA"
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion([], error)
                return
            }
            guard let data = data else {
                print("No data received")
                let emptyResponseError = NSError(domain: "YourDomain", code: 1001, userInfo: nil)
                completion([], emptyResponseError)
                return
            }
            print("Received data:", String(data: data, encoding: .utf8) ?? "")
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(PostsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.posts = response.posts
                    print(self.posts)
                    completion(response.posts, nil)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion([], error)
            }
            
        }
        task.resume()
    }
    
    
    func createPost(message: String, completion: @escaping ([Post]) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYyMjRlMTIwYzBlNjNhYmRhMTUxNzNlIiwiaWF0IjoxNzEzNTI0Mjg4LCJleHAiOjE3MTM1NjAyODh9.AHPliMxJMeavoJa8_uWycgY-LNhLGh0-VC-Y2-vIrLA"
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.getPosts { updatedPosts, error in
                    if let error = error {
                        // Handle error
                        print("Error fetching posts:", error)
                    } else {
                        completion(updatedPosts)
                        print("Updated Posts:", updatedPosts)
                    }
                }
            }
        }
        task.resume()
    }
    
    func likePost(postId: String, completion: @escaping ([Post]) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYyMjRlMTIwYzBlNjNhYmRhMTUxNzNlIiwiaWF0IjoxNzEzNTI0Mjg4LCJleHAiOjE3MTM1NjAyODh9.AHPliMxJMeavoJa8_uWycgY-LNhLGh0-VC-Y2-vIrLA"
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String:Any] = ["postId":postId]
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.getPosts { updatedPosts, error in
                    if let error = error {
                        // Handle error
                        print("Error fetching posts:", error)
                    } else {
                        completion(updatedPosts)
                        print("Updated Posts:", updatedPosts)
                    }
                }
            }
        }
        task.resume()
    }

}
