//
//  SplashscreenView.swift
//  BookRestaurantTable
//
//  Created by user on 02.04.2021.
//

import SwiftUI
import UIKit

struct SplashscreenView: View {
    @ObservedObject var state: SplashscreenState
    var body: some View {
        
        VStack (spacing: 80)  {
                    
            Image(uiImage: #imageLiteral(resourceName: "img-1"))
                .resizable()
                .scaledToFit()
            
                
            //Spacer(minLength: 1)
            VStack(spacing: 8) {
                Button(action: {
                    self.state.controller?.goToLogin()
                }) {
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Subtract"))
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 24, height: 24)

                    Text("Continue with email")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.body)
                    .lineSpacing(22)
                }
                .padding(.vertical, 12)
                .padding(.leading, 68)
                .padding(.trailing, 69)
                .frame(width: 327, height: 48)
                .background(Color(red: 0.96, green: 0.36, blue: 0.33))
                .cornerRadius(24)
                .shadow(radius: 16, y: 8)
                
                Button(action: {
                    // What to perform
                }) {
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "f_logo_RGB-White_72 1"))
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 24, height: 24)

                    Text("Continue with Facebook")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.body)
                    .lineSpacing(22)
                }
                .padding(.horizontal, 51)
                .padding(.vertical, 12)
                .frame(width: 327, height: 48)
                .background(Color(red: 0.09, green: 0.47, blue: 0.95))
                .cornerRadius(24)
                .shadow(radius: 16, y: 8)
                
                Button(action: {
                    // What to perform
                }) {
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Frame 52"))
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 24, height: 24)

                    Text("Continue with Google")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.body)
                    .lineSpacing(22)
                }
                .padding(.vertical, 12)
                .padding(.leading, 61)
                .padding(.trailing, 62)
                .frame(width: 327, height: 48)
                .background(Color.white)
                .cornerRadius(24)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 16, y: 8)
                
                Button(action: {
                    // What to perform
                }) {
                Text("Continue as Guest")
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .font(.body)
                .lineSpacing(22)
                .padding(.horizontal, 90)
                .padding(.vertical, 13)
                .frame(width: 327, height: 48)
                .cornerRadius(24)
                }
            }
            .padding(.horizontal, 10)
            //.frame(width: 327, height: 216)
                
                    
            
        }
        
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
        //.padding(.horizontal, 16)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.84, green: 0.87, blue: 0.91), Color(red: 0.85, green: 0.88, blue: 0.92)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView(state: SplashscreenState())
    }
}
