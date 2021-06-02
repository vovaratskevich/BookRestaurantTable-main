//
//  AccountView.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    var user: User
    var pathBackgroundImage: String = "accountBackgroundImage"
    var pathAvatarImage: String = "accountAvatarImage"
    var email: String = "email@mail.com"
    var body: some View {
        
        ScrollView {
            
            VStack {
                Image(pathBackgroundImage)
                    .resizable()
                    .overlay(
                        VStack(spacing:0){
                            Image (pathAvatarImage)
                                //.resizable()
                                .frame(width: 96, height: 96)
                                .clipShape ( Ellipse())
                                .overlay(Ellipse().stroke(Color.white, lineWidth: 4))
                                .padding(.top,50)
                            
                            VStack (spacing:0) {
                                Text((viewModel.user.firstName ?? "") + " " + (viewModel.user.secondName ?? ""))
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.bottom,6)
                                
                                Text(viewModel.user.email ?? "")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                            .frame(
                                  minWidth: 0,
                                  maxWidth: .infinity,
                                  minHeight: 0,
                                  maxHeight: .infinity,
                                  alignment: .center
                                )
                            Spacer()
                        }
                    )
            }
            
            VStack {
                HStack{
                    Image("profileIcon")
                        .frame(width: 24, height: 24)
                    Text("Account details")
                        .padding(.leading, 12)
                    Spacer()
                    Image("arrowIcon")
                        .frame(width: 16, height: 16)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                    .offset(x: 58)
                
                HStack{
                    Button(action: {
                        viewModel.controller?.goToBookingHistory()
                        
                    }) {
                        Image("profileIcon")
                            .frame(width: 24, height: 24)
                        Text("Booking history")
                            .padding(.leading, 12)
                        Spacer()
                        Image("arrowIcon")
                            .frame(width: 16, height: 16)
                    }
                    
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                    .offset(x: 58)
                
                HStack{
                    Image("profileIcon")
                        .frame(width: 24, height: 24)
                    Text("Favorites")
                        .padding(.leading, 12)
                    Spacer()
                    Image("arrowIcon")
                        .frame(width: 16, height: 16)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                    .offset(x: 58)
                
                HStack{
                    Image("profileIcon")
                        .frame(width: 24, height: 24)
                    Text("Notifications")
                        .padding(.leading, 12)
                    Spacer()
                    Image("arrowIcon")
                        .frame(width: 16, height: 16)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                    .offset(x: 58)
                
                HStack{
                    Image("profileIcon")
                        .frame(width: 24, height: 24)
                    Text("Settings")
                        .padding(.leading, 12)
                    Spacer()
                    Image("arrowIcon")
                        .frame(width: 16, height: 16)
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                    .offset(x: 58)
            }
            .padding(.top)
            
            VStack {
                
                HStack{
                    Text("About")
                        .font(.body)
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                   .offset(x: 16)
                
                HStack{
                    Text("Contact")
                        .font(.body)
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                   .offset(x: 16)
                
                HStack{
                    Text("Terms")
                        .font(.body)
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                   .offset(x: 16)
                
                HStack{
                    Text("Privacy Policy")
                        .font(.body)
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,5)
                .padding(.bottom,5)
                Divider()
                   .offset(x: 16)
                
                HStack{
                    Button(action: {
                            viewModel.logOutButton()                  }) {
                    Text("Log out")
                        .font(.body)
                    Spacer()
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                .padding(.bottom,5)
                Divider()
                   .offset(x: 16)
    
            }
            .padding(.top)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewModel: AccountViewModel(), user: User() )
    }
}
