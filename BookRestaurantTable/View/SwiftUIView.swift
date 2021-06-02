//
//  SwiftUIView.swift
//  BookRestaurantTable
//
//  Created by user on 16.04.2021.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        VStack() {
            VStack(spacing: 18) {
                Ellipse()
                //.fill(Color(red: 1, green: 0, blue: 0.1, opacity: 0.50))
                .frame(width: 96, height: 96)
                .overlay(Ellipse().stroke(Color.white, lineWidth: 4))

                Text("Arlene McCoy")
                .fontWeight(.semibold)
                .font(.title2)
                .tracking(0.35)
                .lineSpacing(28)

                Text("email@mail.com")
                .font(.footnote)
                .lineSpacing(18)
            }
            .padding(.leading, 118)
            .padding(.trailing, 116)
            .padding(.top, 60)
            .padding(.bottom, 30)
            .frame(width: 375, height: 268)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.40))
            .frame(width: 375, height: 268)
            .background(Color(red: 0.50, green: 0.23, blue: 1, opacity: 0.50))

            VStack(spacing: 0) {
                    ZStack {
                                Text("Account details")
                                .font(.body)
                                .frame(width: 271, alignment: .topLeading)
                                .lineSpacing(22)
                                .offset(x: 4, y: 0)


                                ZStack {
                                }
                                .offset(x: -159.50, y: 0)
                                .frame(width: 24, height: 24)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 1, green: 0.23, blue: 0.27, opacity: 0.50))
                        .offset(x: -159.50, y: 0)
                        .frame(width: 24, height: 24)
                    }
                    .frame(width: 375, height: 48)

                    ZStack {
                                Text("Booking history")
                                .font(.body)
                                .frame(width: 271, alignment: .topLeading)
                                .lineSpacing(22)
                                .offset(x: 4, y: 0)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .offset(x: 163.50, y: 0)
                                .frame(width: 16, height: 16)


                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 1, green: 0.23, blue: 0.27, opacity: 0.50))
                        .offset(x: -159.50, y: 0)
                        .frame(width: 24, height: 24)
                    }
                    .frame(width: 375, height: 48)

                    ZStack {
                                Text("Favorites")
                                .font(.body)
                                .frame(width: 271, alignment: .topLeading)
                                .lineSpacing(22)
                                .offset(x: 4, y: 0)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .offset(x: 163.50, y: 0)
                                .frame(width: 16, height: 16)


                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 1, green: 0.23, blue: 0.27, opacity: 0.50))
                                .offset(x: -159.50, y: 0)
                                .frame(width: 24, height: 24)
                    }
                    .frame(width: 375, height: 48)

                    ZStack {
                                Text("Notifications")
                                .font(.body)
                                .frame(width: 271, alignment: .topLeading)
                                .lineSpacing(22)
                                .offset(x: 4, y: 0)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .offset(x: 163.50, y: 0)
                                .frame(width: 16, height: 16)


                                ZStack {
                                }
                                .offset(x: -159.50, y: 0)
                                .frame(width: 24, height: 24)
                    }
                    .frame(width: 375, height: 48)

                    ZStack {
                                Text("Settings")
                                .font(.body)
                                .frame(width: 271, alignment: .topLeading)
                                .lineSpacing(22)
                                .offset(x: 4, y: 0)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .offset(x: 163.50, y: 0)
                                .frame(width: 16, height: 16)


                                ZStack {
                                }
                                .offset(x: -159.50, y: 0)
                                .frame(width: 24, height: 24)
                    }
                    .frame(width: 375, height: 48)
            }

            VStack(spacing: 0) {
                    VStack(alignment: .trailing, spacing: 12.50) {
                                Text("About")
                                .font(.body)
                                .frame(width: 343, alignment: .topLeading)
                                .lineSpacing(22)

                    }
                    .padding(.leading, 16)
                    .padding(.top, 13)
                    .padding(.bottom, 1)
                    .frame(width: 375, height: 48)

                    VStack(alignment: .trailing, spacing: 12.50) {
                                Text("Contact")
                                .font(.body)
                                .frame(width: 343, alignment: .topLeading)
                                .lineSpacing(22)

                    }
                    .padding(.leading, 16)
                    .padding(.top, 13)
                    .padding(.bottom, 1)
                    .frame(width: 375, height: 48)

                    VStack(alignment: .trailing, spacing: 12.50) {
                                Text("Terms")
                                .font(.body)
                                .frame(width: 343, alignment: .topLeading)
                                .lineSpacing(22)

                    }
                    .padding(.leading, 16)
                    .padding(.top, 13)
                    .padding(.bottom, 1)
                    .frame(width: 375, height: 48)

                    VStack(alignment: .trailing, spacing: 12.50) {
                                Text("Privacy Policy")
                                .font(.body)
                                .frame(width: 343, alignment: .topLeading)
                                .lineSpacing(22)

                    }
                    .padding(.leading, 16)
                    .padding(.top, 13)
                    .padding(.bottom, 1)
                    .frame(width: 375, height: 48)
            }

            VStack(alignment: .trailing, spacing: 12.50) {
                    Text("Log out")
                    .font(.body)
                    .frame(width: 343, alignment: .topLeading)
                    .lineSpacing(22)

            }
            .padding(.leading, 16)
            .padding(.top, 13)
            .padding(.bottom, 1)
            .frame(width: 375, height: 48)
        }
        .padding(.bottom, 136)
        .frame(width: 375, height: 932)
        .background(Color.white)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
