//
//  loginView.swift
//  MobileAcebook
//
//  Created by Oluwaseyi Toluhi on 16/04/2024.
//

import Foundation
import SwiftUI
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var token: String?
    
//    Create instance of Authentication service to handle logIn request
    let Auth = AuthenticationService()
    
    var body: some View {
        VStack {
            
            Text("Acebook")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .background(Color(red:241/255, green: 148/255, blue: 138/255))
                .padding()
                
            
            Spacer()
            Text("Log in")
                .font(.title)
                .foregroundColor(.black)
                .padding(.trailing, 240)
            

            TextField("Enter email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
                .padding(.bottom, 20)
            
            TextField("Enter password",text: $password )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
                .padding(.bottom, 20)
     
            Button("SUBMIT") {

                Auth.logIn(email: email, password: password) { receivedToken in
                    if let receivedToken = receivedToken {
//                  login successful
                        self.token = receivedToken
                        print("Logged in successfully with token: \(receivedToken)")
//                        Add storing the token and then navigating below
                    } else {
//                        login fail
                        print("login failed")
                    }
                }
            }
            .padding(.bottom, 300)

            NavigationLink(destination: SignupView()) {
                Text("Don't have an account? Sign up")
            }
            .padding(.bottom, 50)
            
            if let token = token {
                Text("Token: \(token)").padding()
            }
            
        }
        
    }
    
    
    
    } // sign up view












struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
