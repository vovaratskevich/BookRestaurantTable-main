//
//  RegistrationView.swift
//  BookRestaurantTable
//
//  Created by user on 16.04.2021.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel:RegistrationViewModel
    @State var isSecured = true
    @State var isSecured2 = true
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10)  {
                
                HStack {
                    
                }
                .padding(.bottom)
                        
                Image(uiImage: #imageLiteral(resourceName: "img-3"))
                    .resizable()
                    .scaledToFit()
                Text("First Name")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(width: 327, alignment: .topLeading)
                    .lineSpacing(18)
                    .padding(.top, 2)
                    //.padding(.bottom)
                    .frame(width: 327, height: 24)
                
                TextField("", text: $viewModel.firstName)
                    .frame(width: 327, height: 48)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(8)
                Text("Last Name")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(width: 327, alignment: .topLeading)
                    .lineSpacing(18)
                    .padding(.top, 2)
                    //.padding(.bottom)
                    .frame(width: 327, height: 24)
                
                TextField("", text: $viewModel.secondName)
                    .frame(width: 327, height: 48)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(8)
                //Spacer(minLength: 1)
                VStack(spacing: 0) {
                    
                    Text("Email")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .frame(width: 327, alignment: .topLeading)
                        .lineSpacing(18)
                        .padding(.top, 2)
                        //.padding(.bottom)
                        .frame(width: 327, height: 24)
                    
                    TextField("", text: $viewModel.email)
                        .frame(width: 327, height: 48)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(8)
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .frame(width: 327, alignment: .topLeading)
                        .lineSpacing(18)
                        //.padding(.top, 2)
                        //.padding(.bottom)
                        .frame(width: 327, height: 24)
                        .padding(.top,15)
                    
                    ZStack(alignment: .trailing) {
                        if isSecured {
                            SecureField("", text: $viewModel.password)
                                .frame(width: 327, height: 48)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(8)
                        }
                        else {
                            TextField("", text: $viewModel.password)
                                .frame(width: 327, height: 48)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(8)
                        }
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(uiImage: self.isSecured ? #imageLiteral(resourceName: "hide2") : #imageLiteral(resourceName: "hide"))
                        }
                        .padding(.trailing,10)
                    }
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .frame(width: 327, alignment: .topLeading)
                        .lineSpacing(18)
                        //.padding(.top, 2)
                        //.padding(.bottom)
                        .frame(width: 327, height: 24)
                        .padding(.top,15)
                    
                    ZStack(alignment: .trailing) {
                        if isSecured2 {
                            SecureField("", text: $viewModel.passwordSecond)
                                .frame(width: 327, height: 48)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(8)
                        }
                        else {
                            TextField("", text: $viewModel.passwordSecond)
                                .frame(width: 327, height: 48)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(8)
                        }
                        Button(action: {
                            isSecured2.toggle()
                        }) {
                            Image(uiImage: self.isSecured2 ? #imageLiteral(resourceName: "hide2") : #imageLiteral(resourceName: "hide"))
                        }
                        .padding(.trailing,10)
                    }

                    
                    Button(action: {
                        viewModel.signUpButton()
                        // What to perform
                    }) {
                        Text("Sign up")
                            .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    }
                    .frame(width: 226, height: 48)
                    .background(Color(red: 0.23, green: 0.49, blue: 1))
                    .cornerRadius(24)
                    .shadow(radius: 16, y: 8)
                    .padding(.top,15)
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Button(action: {
                            // What to perform
                            viewModel.controller?.goToLogin()
                        }) {
                        Text("Sign in")
                            .font(.footnote)
                            .foregroundColor(.black)
                            
                        
                        }
                    }
                    
                    .padding(.top,30)
                    .padding(.bottom, 30)
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
            //.background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.93, green: 0.93, blue: 0.94), Color(red: 0.88, green: 0.88, blue: 0.89)]), startPoint: .top, endPoint: .bottom))
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.93, green: 0.93, blue: 0.94), Color(red: 0.88, green: 0.88, blue: 0.89)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
}
