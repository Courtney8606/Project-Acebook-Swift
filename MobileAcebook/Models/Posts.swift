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
    var token: String = ""
    
    struct PostsResponse: Decodable {
        let posts: [Post]
        let token: String
    }
    
    func getPosts(token: String, completion: @escaping ([Post], String, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion([], "", error)
                return
            }
            guard let data = data else {
                print("No data received")
                let emptyResponseError = NSError(domain: "YourDomain", code: 1001, userInfo: nil)
                completion([], "", emptyResponseError)
                return
            }
            print("Received data:", String(data: data, encoding: .utf8) ?? "")
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(PostsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.posts = response.posts
                    self.token = response.token
                    print(self.posts)
                    completion(response.posts, response.token, nil)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion([], "", error)
            }
            
        }
        task.resume()
    }

    struct CreatePostResponse: Decodable {
        let message: String
        let token: String
    }
    
    func createPost(token: String, message: String, completion: @escaping (String, String) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String:Any] = ["token":token, "message":message]
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
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(CreatePostResponse.self, from: data)
                DispatchQueue.main.async {
                    self.token = response.token
                }
                
            } catch {
                print("Error decoding JSON: \(error)")
                completion("", "")
            }
                
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.getPosts(token: token) { updatedPosts, token, error in
                    if let error = error {
                        // Handle error
                        print("Error fetching posts:", error)
                    } else {
                        completion(token, "")
                        print("Updated Posts:", updatedPosts)
                    }
                }
            }
        }
        task.resume()
    }
    
    func likePost(token: String, postId: String, completion: @escaping ([Post]) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/posts")!)
        let parameters: [String:Any] = ["token":token, "postId":postId]
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                self.getPosts(token: token) { updatedPosts, token, error in
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
