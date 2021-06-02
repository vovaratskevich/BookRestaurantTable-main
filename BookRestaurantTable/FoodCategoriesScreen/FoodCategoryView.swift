//
//  FoodCategoryView.swift
//  BookRestaurantTable
//
//  Created by user on 16.04.2021.
//

import SwiftUI

struct FoodCategoryView: View {
    @ObservedObject var viewModel: FoodCategoryViewModel
    var gridItems:[GridItem]  = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    var body: some View {
        VStack{
            ZStack {
                HStack{
                    Button(action:{
                        viewModel.controller?.goToHome()
                    })
                    {
                        Image(uiImage: #imageLiteral(resourceName: "Union"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                }
                .padding(.leading)
                
                Text("Food Category")
                    .fontWeight(.semibold)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            ScrollView(showsIndicators:false){
                LazyVGrid(columns: gridItems){
                    ForEach(viewModel.foodCategories) {
                        foodCategory in
                        Button(action: {
                            //
                        }){
                            FoodCategoriesItemView(foodCategory: foodCategory)
                        }
                    }
                }
                .padding(.top)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct FoodCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategoryView(viewModel: FoodCategoryViewModel())
    }
}
