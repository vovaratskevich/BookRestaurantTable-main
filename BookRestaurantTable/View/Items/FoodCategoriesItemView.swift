//
//  FoodCategoriesItemView.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import SwiftUI

struct FoodCategoriesItemView: View {
    var foodCategory = FoodCategory()
    var title:String = "Pizza"
    var pathImage:String = "img-4"
    var body: some View {
        
        VStack{
            Ellipse()
            .fill(Color(red: 0.24, green: 0.49, blue: 1, opacity: 0.08))
            .frame(width: 109, height: 109)  
            .overlay(
                Image(uiImage: foodCategory.getImageURL().loadImage())
                    .resizable()
                    .frame(width:44,height: 44)
            )
            Text(foodCategory.name ?? "")
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.body)
        }
    }
}

struct FoodCategoriesItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategoriesItemView()
    }
}
