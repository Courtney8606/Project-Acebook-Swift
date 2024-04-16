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
    var body: some View {
        VStack {
            
            Text("Acebook")
                .font(.largeTitle)
            Image("piano")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .accessibilityIdentifier("piano")
            Spacer()
            Text("Sign up")
                .font(.title)
                .foregroundColor(.blue)
            //.padding(.bottom, 50)
                .padding(.trailing, 200)
            
            TextField("Enter email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
            TextField("Enter username", text:/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
            
            TextField("Enter password",text:/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/ )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
            TextField("Re-enter password",text:/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 40)
                .padding(.leading, 40)
                .padding(.bottom)
            
            HStack {
                Text("Upload a profile picture")

                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/} //button
                
        
                
                
            }//HStack
            .padding(.bottom, 100)
            
            Button("SUBMIT") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                
            }// sign up button
            
                .padding(.bottom, 100)

            
            .padding(.bottom, 100)
            
            
            
        }
        
    }
    
    
    
    } // sign up view












struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
