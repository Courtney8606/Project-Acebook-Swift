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
//    Set readyToNavigate state to false, to track navigation on login
    @State private var readyToNavigate: Bool = false
    
//    Create instance of Authentication service to handle logIn request
    let Auth = AuthenticationService()
//    Initialise userDefaults var to get / write token as userDefaults key
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        NavigationStack {
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
                    .autocapitalization(.none)
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .padding(.bottom, 20)
                
                TextField("Enter password",text: $password )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .padding(.bottom, 20)
                
                Button("SUBMIT") {
                    Auth.logIn(email: email, password: password) { receivedToken in
                        if let receivedToken = receivedToken {
                            // On login successful:
                            // Store token in userDefaults
                            userDefaults.set(receivedToken, forKey: "token")
                            // To print the token on login, use:
                            // print("Token stored in userDefaults as \(userDefaults.object(forKey: "token") ?? "default/no token")")
                            // Or, to access the token (or any value stored against a key in UserDefaults) in another view, you need to call
                            // @AppStorage("token") var token: String = ""
                            // somewhere near the top of your view and then you can access it as token (no quotes) anywhere you want
                            
                            // Finally, set navigation state as ready to navigate
                            readyToNavigate = true
                        } else {
                            // On login fail:
                            print("Login failed")
                        }
                    }
                }
                .navigationTitle("Navigation")
                .navigationDestination(isPresented: $readyToNavigate) {
                    FeedPageView()
                }
                .padding(.bottom, 300)
                
                NavigationLink(destination: SignupView()) {
                    Text("Don't have an account? Sign up")
                }
                .padding(.bottom, 50)

            }
        }
    }
} // sign up view


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
