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
    var likes: [String]
    
    struct CreatedBy: Decodable { // Add a nested struct for createdBy
        var _id: String
        var username: String
        var profilePicture: String
    }
    
    
    init(_id:String, message: String, createdAt: String, createdBy: CreatedBy, likes: [String]){
        self._id = _id
        self.message = message
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.likes = likes
    }
    
    
    func constructedPost() -> String {
        return "Post(\(self._id), \"\(self.message)\", \"\(self.createdAt)\")"
    }
    
}
