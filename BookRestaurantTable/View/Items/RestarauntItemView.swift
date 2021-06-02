//
//  RestarauntItemView.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import SwiftUI

struct RestarauntItemView: View {
    var restaurant = Restaurant()
    @State var isFavorite:Bool = false
    @State var isRestarauntsScreen:Bool = false
    var body: some View {
        VStack(alignment:.leading, spacing:0){
            
            ZStack {
                Image(uiImage: restaurant.getImageURL().loadImage())
                    .resizable()
                    .frame(width: 168, height: 136)
                    .cornerRadius(16)
                
                ZStack {
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                    Circle()
                        .foregroundColor(isFavorite ? .blue : Color(red: 0, green: 0, blue: 0, opacity: 0.48))
                        .frame(width:40,height: 40)
                        .overlay(
                            Image(systemName: "heart" )
                                .resizable()
                                .foregroundColor(.white)
                                .padding(10)
                            ,alignment: .topTrailing)
                        
                    }
                    .frame(width: 24, height: 24)
                }
                .padding(.leading, 120)
                .padding(.trailing, 8)
                .padding(.top, 8)
                .padding(.bottom, 88)
                
            }
            
            Text(restaurant.name ?? "")
            .fontWeight(.semibold)
            .font(.body)
            .padding(.top)
            .foregroundColor(.black)
            
            HStack (spacing:5) {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 16, height: 16)
                
                Text(String(format:"%.01f" , restaurant.rating ?? 5.0))
                .font(.footnote)
                .foregroundColor(.black)
                
                Text("(" + String(restaurant.reviewsCount ?? 0) + ")")
                .font(.footnote)
                .foregroundColor(.gray)
               
            }
            .padding(.top, 5)
            
        }
        //.frame(width: 228, height: 136)
    }
}

struct RestaurantItemView_Previews: PreviewProvider {
    static var previews: some View {
        RestarauntItemView()
    }
}

