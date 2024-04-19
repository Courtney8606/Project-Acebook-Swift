//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    Spacer()
                    
                    Text("Welcome to Acebook!")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .accessibilityIdentifier("welcomeText")
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color(red: 253/255, green: 210/255, blue: 184/255))
                            .frame(width: 240, height: 240)
                        
                        Image("piano")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .accessibilityIdentifier("piano")
                            .padding(.leading, 30)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: SignupView()) {
                        Text("Sign Up")
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 253/255, green: 210/255, blue: 184/255))
                                    .frame(width: 100)
                            )
                    }
                    NavigationLink(destination: LoginView()) {
                        Text("Log in")
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 253/255, green: 210/255, blue: 184/255))
                                    .frame(width: 100)
                            )
                    }
                    Spacer()
                }
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
