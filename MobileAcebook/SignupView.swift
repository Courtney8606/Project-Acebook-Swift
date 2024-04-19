//
//  SignupView.swift
//  MobileAcebook
//
//  Created by kevin eboda on 16/04/2024.
//
//
//  SignupView.swift
//  MobileAcebook
//
//  Created by kevin eboda on 16/04/2024.
//

import SwiftUI

struct SignupView: View {
    @State private var _id = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var imgUrl = ""
    @State private var repassword = ""
    @State private var shouldNavigateToLogin: Bool = false
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
      
        NavigationStack{
            VStack {
                
                VStack {
                Text("Acebook")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 210/255, blue: 184/255))
                    .padding(.bottom, -10) // Adjust the negative padding as needed

                ZStack {
                    Color(red: 253/255, green: 210/255, blue: 184/255)
                    if let image = selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                } else {
                                    Image("piano")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .accessibilityIdentifier("piano")
                                }
        
                       
                }
            }
            Spacer(minLength: 90)
                Text("Sign up")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.trailing, 200)
                
                TextField("Enter email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                TextField("Enter username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                
                TextField("Enter password",text: $password )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                TextField("Re-enter password",text: $repassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .padding(.bottom)
                
                HStack {
                Text("Upload a profile picture")
                Button(action: {
                    isShowingImagePicker = true
                    print("Button tapped")
                   
                }) {
                    Image("upload")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(selectedImage: $selectedImage, imageName: $imgUrl)
                }
            }
                .padding(.bottom, 50)
                
                Button {
                guard !email.isEmpty, !username.isEmpty, !password.isEmpty, !repassword.isEmpty else {
                       print("Please fill in all fields")
                       return
                   }
               guard password == repassword else {
                   print("password does not match")
                   return
               }
                    let newUser = User(_id: "", email: email, password: password, username: username, imgUrl: imgUrl)
                print("Before postNewUser is called")
                    postNewUser(user: newUser) { result in
                        switch result {
                        case .success(let statusCode):
                            shouldNavigateToLogin = true
                            print("Successfully created user with status code: \(statusCode)")
                        case .failure(let error):
                            print("Error creating user: \(error)")
                        }
                    }
               } label: {
                Text("SUBMIT")
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 253/255, green: 210/255, blue: 184/255))
                                .frame(width: 100)
                        )
                }
                  
           }
//                .navigationTitle("Navigation")
                .navigationDestination(isPresented: $shouldNavigateToLogin) {
                    LoginView()
                       }
                NavigationLink(destination: LoginView()) {
                    Text("Already have an account? Loged in")
                }
                
            } //end of vstack
            
        }
        
    }
    
    // sign up view




struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
