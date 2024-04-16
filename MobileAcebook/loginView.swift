//
//  loginView.swift
//  MobileAcebook
//
//  Created by Oluwaseyi Toluhi on 16/04/2024.
//

import Foundation
import SwiftUI
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
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
            

            TextField("Enter username", text: $username)
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
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(.bottom, 300)

            Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                Text("Don't have an account? Sign up")
            }
            .padding(.bottom, 50)
            
        }
        
    }
    
    
    
    } // sign up view












struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
