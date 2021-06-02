//
//  HomeView.swift
//  BookRestaurantTable
//
//  Created by user on 19.04.2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        VStack (alignment:.leading, spacing: 10)  {
            HStack {
                  Image(uiImage: #imageLiteral(resourceName: "pin"))
                    .resizable()
                    .frame(width:23,height:23)
                
                VStack(alignment:.leading){
                    Text("Location")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        //.lineSpacing(18)
                    
                    Button(action:{
                        // What to perform
                    }){
                    HStack(alignment:.bottom){
                        Text("Current location")
                            .fontWeight(.semibold)
                            .font(.body)
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width:5,height: 10)
                            .padding(4)
                    }
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action:{
                    // What to perform
                }){
                Image(systemName:"magnifyingglass")
                    .resizable()
                    .frame(width:22,height: 22)
                    .foregroundColor(.black)
                }
            }
            
            ScrollView(showsIndicators:false){
                
                HStack {
                    Text("My Favorite Restaraunts")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .tracking(0.35)
                    
                    Spacer()
                    
                    Button(action:{
                        // What to perform
                    }){
                    Text("See all")
                    .font(.body)
                    
                    Image(systemName:"chevron.right" )
                        .resizable()
                        .frame(width: 6, height: 10)
                    }
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators:false){
                    LazyHStack {
                        ForEach(self.viewModel.restaurants)
                        {restaurant in
                            Button(action:{
                                viewModel.controller?.goToRestaraunt(restaurant: restaurant)
                               // self.viewModel.controller?.goToRestaurant(restaurant: restaurant)
                            }){
                                RestarauntItemView (restaurant: restaurant, isFavorite: true).overlay(
                                    Button(action:{
                                       // viewModel.handlerHeartTap(restaurant:restaurant)
                                    })
                                    {
                                        //HeartView(isFavourite: restaurant.favourite ?? false)
                                    }, alignment: .topTrailing)
                                
                            }
                           
                        }
                    }
                   .frame(width: .infinity, height: 208)
                }
                
                HStack {
                    Text("Restaraunts")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .tracking(0.35)
                    
                    Spacer()
                    
                    Button(action:{
                        viewModel.controller?.goToRestaraunts()
                    }){
                    Text("See all")
                    .font(.body)
                    
                    Image(systemName:"chevron.right" )
                        .resizable()
                        .frame(width: 6, height: 10)
                    }
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal,showsIndicators:false){
                    LazyHStack {
                        ForEach(self.viewModel.restaurants)
                        {restaurant in
                            Button(action:{
                                viewModel.controller?.goToRestaraunt(restaurant: restaurant)
                               // self.viewModel.controller?.goToRestaurant(restaurant: restaurant)
                            }){
                                RestarauntItemView (restaurant: restaurant, isFavorite: false).overlay(
                                    Button(action:{
                                       // viewModel.handlerHeartTap(restaurant:restaurant)
                                    })
                                    {
                                        //HeartView(isFavourite: restaurant.favourite ?? false)
                                    }, alignment: .topTrailing)
                                
                            }
                           
                        }
                    }
                    .frame(width: .infinity, height: 208)
                }
                
                HStack {
                    Text("Food Categories")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .tracking(0.35)
                    
                    Spacer()
                    
                    Button(action:{
                        viewModel.controller?.goToFoodCategories()
                    }){
                    Text("See all")
                    .font(.body)
                    
                    Image(systemName:"chevron.right" )
                        .resizable()
                        .frame(width: 6, height: 10)
                    }
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal,showsIndicators:false){
                    LazyHStack {
                        ForEach(viewModel.foodCategories) {
                            foodCategory in
                            Button(action: {
                                //
                            }){
                                FoodCategoriesItemView(foodCategory: foodCategory)
                            }
                        }
                        
                    }
                   .frame(width: .infinity, height: 162)
                }
                
            }

        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
        .padding(.horizontal, 16)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
