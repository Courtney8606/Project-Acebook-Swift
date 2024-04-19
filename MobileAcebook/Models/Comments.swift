//
//  Comments.swift
//  MobileAcebook
//
//  Created by Jack Collett on 19/04/2024.
//

import Foundation

class CommentsStore: ObservableObject {

    @Published var comments: [Comment] = []
    
    struct CommentsResponse: Decodable {
      let message: String
      let comments: [Comment]
      let token: String
    }
    
    func getCommentsByPost(postId: String, completion: @escaping ([Comment]) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/comments/662127acfdf76f723ed0074f")!)
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZTc3MDc4ZDhlZjExMTE4NTQ4NTE3IiwiaWF0IjoxNzEzNTMzNjQyLCJleHAiOjE3MTM1MzQyNDJ9.6jc9dVlSlQkUEO9fFD-a-6l3hm_ZSpySEhW8hL_VTj8"
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        //  request.setValue("661d5262e21f06f5b53ab545", forHTTPHeaderField: "user_id")
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
                let response = try decoder.decode(CommentsResponse.self, from: data)
                self.comments = response.comments
                completion(response.comments)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    func createNewComment(message: String, completion: @escaping ([Comment]) -> Void) {
        var request = URLRequest(url: URL(string: "http://localhost:3000/comments/662127acfdf76f723ed0074f")!)
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjYxZTc3MDc4ZDhlZjExMTE4NTQ4NTE3IiwiaWF0IjoxNzEzNTMzNjQyLCJleHAiOjE3MTM1MzQyNDJ9.6jc9dVlSlQkUEO9fFD-a-6l3hm_ZSpySEhW8hL_VTj8"
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
}
