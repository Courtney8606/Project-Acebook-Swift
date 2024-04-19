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
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var repassword = ""
    var body: some View {
        VStack {
            
            VStack {
                Text("Acebook")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 210/255, blue: 184/255))
                    .padding(.bottom, -10) // Adjust the negative padding as needed

                ZStack {
                    Color(red: 253/255, green: 210/255, blue: 184/255)
                    Image("piano")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .accessibilityIdentifier("piano")
                }
            }
            Spacer(minLength: 50)
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
                Button(action: {}) {
                    Image("upload")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.bottom, 50)
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
            .padding(.bottom, 50)

            NavigationLink(destination: LoginView()) {
                Text("Already have an account? Log in")
            }
            .padding(.bottom, 50)
            
        }
        
    }
    
    
    
     // sign up view












struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
