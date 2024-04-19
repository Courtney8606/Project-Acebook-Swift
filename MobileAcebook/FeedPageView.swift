//
//  FeedPageView.swift
//  MobileAcebook
//
//  Created by Patrick Skipworth on 17/04/2024.
//

import SwiftUI

struct FeedPageView: View {
    @ObservedObject var postStore = PostStore()
    @State var message = ""
    @State var token = ""
    
    //    Initialise userDefaults var to get / write token as userDefaults key
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            VStack {
                Spacer().frame(height: 80)
                Text("View all posts")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 30))
                    .padding(.bottom, 20)
            }
            .background(Color(red: 253/255, green: 210/255, blue: 184/255))
            VStack {
                Section(header: Text("Create Post")) {
                    HStack{
                        TextField("Enter message", text:$message)
                        Button("Submit"){
                            guard !message.isEmpty else { return }
                            token = userDefaults.object(forKey: "token") as! String
                            postStore.createPost(token: token, message: message) { newToken, newMessage in
                                print("Post created successfully!")
                                userDefaults.set(newToken, forKey: "token")
                                token = newToken
                            }
                            message = ""
                        }
                    }
                }
                .padding(.horizontal, 15)
                
                List($postStore.posts, id: \._id) { post in
                    HStack {
                        VStack {
                            
                            Image("profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .accessibilityIdentifier("profile")
                            
                            Text("\(post.createdBy.username.wrappedValue)")
                                .font(.system(size: 10))
                        }
                        
                        VStack {
                            Text("Message: \(post.message.wrappedValue)")
                                .multilineTextAlignment(.leading)
                                .frame(width: 200)
                                .font(.system(size: 14))
                            
                            Text("\(formattedDate(from: post.createdAt.wrappedValue))")
                                .multilineTextAlignment(.leading)
                                .frame(width: 200)
                                .font(.system(size: 10))
                            Button(action: {
                                postStore.likePost(token: token, postId: post._id.wrappedValue) {newLikes in
                                    print("Successully liked!")
                                    token = userDefaults.object(forKey: "token") as! String
                                    postStore.getPosts(token:token) { fetchedPosts, token, error in
                                        print("Successully updated!")
                                    }
                                }
                            }) {
                                HStack {
                                    Image("like")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("\(post.likes.count)")
                                }
                            }
                            
                        }
                    }
                }
                .onAppear {
                    token = userDefaults.object(forKey: "token") as! String
                    postStore.getPosts(token:token) { fetchedPosts, token, error in
                        if let error = error {
                            print("Error fetching posts:", error)
                        } else {
                            print("Received posts in FeedPageView:", fetchedPosts)
                        }
                    }
                }
            }
        }
    }
    
    struct FeedPageView_Previews: PreviewProvider {
        static var previews: some View {
            FeedPageView()
        }
    }
}
