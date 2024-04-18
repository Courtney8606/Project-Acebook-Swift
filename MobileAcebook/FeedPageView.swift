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
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Text("View all posts")
                .font(.system(size: 30))
            Spacer().frame(height: 30)
            Divider()
            VStack {
                Section(header: Text("Create Post")) {
                    HStack{
                        TextField("Enter message", text:$message)
                        Button("Submit"){
                            guard !message.isEmpty else { return }
                            postStore.createPost(message: message) {newPosts in
                                print("Post created successfully!")
                            }
                            message = ""
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
            
            List(postStore.posts, id: \._id) { post in
                PostRowView(post: post)
               
            }
            .onAppear {
                print("Posts in List:", postStore.posts)
            }
        }
        .onAppear {
            postStore.getPosts { fetchedPosts, error in
                if let error = error {
                    print("Error fetching posts:", error)
                } else {
                    print("Received posts in FeedPageView:", fetchedPosts)
                }
            }
        }
        }
    }


struct PostRowView: View {
    let post: Post
    
    var body: some View {
        HStack {
            VStack {
                Image("piano")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .accessibilityIdentifier("piano")
                    .background(Color.gray)
                
                Text("\(post.createdBy.username)")
                    .font(.system(size: 10))
            }
            
            VStack {
                Text("Message: \(post.message)")
                    .multilineTextAlignment(.leading)
                    .frame(width: 200)
                    .font(.system(size: 14))
                
                Text("\(formattedDate(from: post.createdAt))")
                    .multilineTextAlignment(.leading)
                    .frame(width: 200)
                    .font(.system(size: 14))
                Text("\(numberLikes(likes: post.likes))")
                Button("Submit"){
                    
                }
                Divider()
            }
            .padding()
        }
    }
}

func numberLikes(likes: [String]) -> Int {
    var numLikes = likes.count
    return numLikes
}

struct FeedPageView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPageView()
    }
}

    
