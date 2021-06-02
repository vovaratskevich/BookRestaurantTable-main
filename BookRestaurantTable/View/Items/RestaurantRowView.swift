//
//  RestauraneRowView.swift
//  Restaurants
//
//  Created by student on 7.04.21.
//

import SwiftUI

struct RestaurantRowView: View {
    var nameImage:String = "rest1"
    var nameRestaurant:String = "Boucherie West Village"
    var rating:String = "4.2"
    var numberOfRatings:String = "1344"
    @State var isFavorite:Bool = false
    var body: some View {
        VStack(alignment:.leading, spacing:0){
            
            Image(nameImage)
                .resizable()
                .frame(maxWidth:226,maxHeight: 138)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(16)
                .overlay(
                    Button(action:{isFavorite.toggle()}){
                        Circle()
                            .foregroundColor(isFavorite ? .blue : .black)
                            .opacity(isFavorite ? 1 : 0.48)
                            .frame(width:40,height: 40)
                            .overlay(
                                Image(systemName: "heart" )
                                    .resizable()
                                    .foregroundColor(.white)
                                    .padding(10)
                            ).padding(7)
                    }
                    .foregroundColor(.white),alignment: .topTrailing)
            
            Text(nameRestaurant).bold()
                .font(.system(size: 17))
                .padding(.top,10)
            HStack(spacing:0){
                Image(systemName: "star.fill").resizable()
                    .foregroundColor(.yellow)
                    .frame(width:15,height: 15)
                    .padding(.trailing,10)
                Text(rating).font(.system(size: 13))
                Text("(" + numberOfRatings + ")")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            
            
        }
    }
}

struct RestaurantRowView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRowView()
    }
}
