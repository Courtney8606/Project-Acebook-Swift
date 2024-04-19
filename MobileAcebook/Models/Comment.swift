//
//  Comment.swift
//  MobileAcebook
//
//  Created by Jack Collett on 19/04/2024.
//
import Foundation
import SwiftUI
class Comment: Decodable {
    var _id: String
    // var underPost: String
    var message: String
    var createdAt: String
    var createdBy: CreatedBy
    struct CreatedBy: Decodable { // Add a nested struct for createdBy
        var _id: String
        var username: String
        var profilePicture: String?
    }//createdBY
    init(_id:String, message: String, createdAt: String, createdBy: CreatedBy){
        self._id = _id
        // self.underPost = underPost
        self.message = message
        self.createdAt = createdAt
        self.createdBy = createdBy
    }//init
    func constructedComment() -> String {
        return "Comment(\(self._id), \"\(self.message)\", \"\(self.createdAt)\")"
    }
}

//let comment = Comment(_id: "12", underPost: "44", message: "this is a new comment", createdAt: "now", createdBy: Comment.CreatedBy(_id: "5675", username: "kevin", profilePicture: ""))
////print(comment)
//// Call the createNewComment function
//createNewComment(message: "Testing Comment") { comment in
//  // This closure will be executed after the request completes
//  // You can handle the response here, for example, updating UI or performing other tasks
//  print("New comment created successfully")
//}









