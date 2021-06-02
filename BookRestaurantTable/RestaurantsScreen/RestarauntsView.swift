//
//  RestarauntsView.swift
//  BookRestaurantTable
//
//  Created by user on 16.04.2021.
//

import SwiftUI

struct RestaurantsView: View {
        @ObservedObject var viewModel: RestaurantsViewModel
        var gridItems:[GridItem]  = [
            GridItem(.flexible()),
            GridItem(.flexible())]
        var body: some View {
            VStack{
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
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                    Text("Restaraunts")
                        .fontWeight(.semibold)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action:{
                        // What to perform
                        
                    })
                    {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .foregroundColor(.black)
                    .padding(.trailing)
                }
                
                ScrollView(showsIndicators:false){
                    LazyVGrid(columns: gridItems){
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
                    .padding(.top)
                    .padding(.horizontal, 16)
                }
            }
        }
}

struct RestarauntsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(viewModel: RestaurantsViewModel())
    }
}
