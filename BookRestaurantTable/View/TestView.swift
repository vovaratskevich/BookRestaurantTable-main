//
//  TestView.swift
//  BookRestaurantTable
//
//  Created by user on 19.04.2021.
//

import SwiftUI

struct TestView: View {
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
        Group {
            Text("In progress")
            .font(.footnote)
            .lineSpacing(18)
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(Color(red: 0.24, green: 0.49, blue: 1, opacity: 0.08))
            .cornerRadius(20)

            Text("ID199029")
            .fontWeight(.semibold)
            .font(.body)
            .frame(width: 343, alignment: .topLeading)
            .lineSpacing(22)

            Text("$140.00")
            .fontWeight(.semibold)
            .font(.body)
            .lineSpacing(22)

            Text("August 20,2020 5:00 PM")
            .font(.footnote)
            .lineSpacing(18)

            ZStack {
            }
            .frame(width: 16, height: 16)

            Text("4 Persons")
            .font(.footnote)
            .lineSpacing(18)

            ZStack {
            }
            .frame(width: 16, height: 16)

            HStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .frame(width: 72, height: 72)

                    VStack(alignment: .leading, spacing: 2) {
                                Text("Hi-Collar")
                                .fontWeight(.semibold)
                                .font(.body)
                                .lineSpacing(22)

                                HStack(spacing: 4) {
                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .frame(width: 16, height: 16)

                                                Text("4.5 (349)")
                                                .font(.footnote)
                                                .lineSpacing(18)
                                }
                    }
            }
            .padding(.trailing, 177)
            .frame(width: 343, height: 72)

            Text("Cancel")
            .fontWeight(.semibold)
            .font(.body)
            .multilineTextAlignment(.center)
            .frame(width: 194, alignment: .top)
            .lineSpacing(22)
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
            .frame(width: 226, height: 48)
            .background(Color(red: 0.24, green: 0.49, blue: 1))
            .cornerRadius(24)
            .shadow(radius: 16, y: 8)

        }
        }
        .padding(.leading, 16)
        .padding(.top, 13)
        .padding(.bottom, 1)
        .frame(width: 375, height: 258)
}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
