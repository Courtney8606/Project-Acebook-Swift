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
    @State private var repassword = ""
    var body: some View {
        VStack {
            
            Text("Acebook")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .background(Color(red:241/255, green: 148/255, blue: 138/255))
                .padding()
            Image("piano")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .accessibilityIdentifier("piano")
            Spacer()
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
                Button(action:{})
                {Image("attachment-icon")}
            }
            .padding(.bottom, 50)
            Button("SUBMIT") {
                guard password == repassword else {
                                    print("password does not match")
                    return
                                }
                                // Create a User object with the form data
                let newUser = User(_id: _id, email: email, password: password, username: username)
                                // Call the postNewUser function to send the user data to the API
                postNewUser(user: newUser) { success in
                    if success {
                                // Redirect to a success page or show a success message
                        print("User signed up successfully")
                    }else {
                                        // Show an error message or handle the failure case
                        print("Failed to sign up user")
                                    }
                                }
            }
            .padding(.bottom, 50)

          // NavigationLink(destination: LoginView()) {
            //    Text("Already have an account? Log in")
           // }
            .padding(.bottom, 50)
            
        }
        
    }
    
    
    
    } // sign up view












struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
