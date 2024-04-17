//
//  FeedPageView.swift
//  MobileAcebook
//
//  Created by Patrick Skipworth on 17/04/2024.
//

import SwiftUI
struct FeedPageView: View {
  var body: some View {
    ZStack{
      VStack{
      HStack(alignment: .top){
          VStack{
            Image("makers-logo")
              .resizable()
              .scaledToFit()
              .frame(width: 50, height: 50)
              .accessibilityIdentifier("makers-logo")
              .background(Color.gray)
            Text("Username1")
              .font(.system(size: 10))
          }
          Spacer().frame(width: 10)
          VStack{
            Text("Test post content - This is my first time posting on our acebook app!!!! please like follow and subscribe Test post content - This is my first time posting on our acebook app!!!!")
              .multilineTextAlignment(.leading)
              .frame(width:280)
              .font(.system(size:12))
          }
        }
        HStack(alignment: .top){
          VStack{
            Image("makers-logo")
              .resizable()
              .scaledToFit()
              .frame(width: 50, height: 50)
              .accessibilityIdentifier("makers-logo")
              .background(Color.gray)
            Text("Username1")
              .font(.system(size: 10))
          }
          Spacer().frame(width: 10)
          VStack{
            Text("Test post content - This is my first time posting on our acebook app!!!! please like follow and subscribe Test post content - This is my first time posting on our acebook app!!!! please like follow and subscribe Test post content - This is my first time posting on our acebook app!!!! please like follow and subscribe")
              .multilineTextAlignment(.leading)
              .frame(width:280)
              .font(.system(size:12))
          }
        }
        }
    }
  }
}
struct FeedPageView_Previews: PreviewProvider {
  static var previews: some View {
    FeedPageView()
  }
}
