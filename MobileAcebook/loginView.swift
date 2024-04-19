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
            Spacer(minLength: 80)
            VStack {
                Text("Acebook")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 210/255, blue: 184/255))
                    .padding(.bottom, -10)

                ZStack {
                    Color(red: 253/255, green: 210/255, blue: 184/255)
                    Image("piano")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .accessibilityIdentifier("piano")
                        .padding(.bottom, 40)
                }
            }
            Spacer(minLength: 50)

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
     
            Button {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
            .padding(.bottom, 300)

            NavigationLink(destination: SignupView()) {
                Text("Don't have an account? Sign up")
            }
            .padding(.bottom, 50)
            
        }
        
    }
    
    
    
     // sign up view












struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
