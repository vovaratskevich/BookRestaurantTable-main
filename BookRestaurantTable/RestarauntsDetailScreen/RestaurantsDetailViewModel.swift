//
//  RestaurantsDetailViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 20.05.2021.
//

import Foundation
import Combine

final class RestaurantsDetailViewModel: ObservableObject {
    var controller: RestaurantsDetailViewController?
    @Published var restaurant = Restaurant()
    //@Published var categories = [Category]()
   // @Published var restaurants = [Restaurant]()
   // @Published var  favourites = [Restaurant]()
  //  @Published var isEmptyFavorite:Bool = true
    
  //  private var cancellableCategories: AnyCancellable?
  //  private var cancellableRestaurants:AnyCancellable?
   // private var cancellableFavourites:AnyCancellable?
    
    //private let viewModel = RegistrationViewModel()
    private  var cancelable:AnyCancellable?
       
    
    
    
    
    //func fetchCategories()
   // {
    //    cancellableCategories = APIRequest.shared.fetchCategories(page: 1)
     //       .sink(receiveCompletion: {_ in}, receiveValue: {item
                    
    //                in self.categories = item.data ?? []})
   // }
   
    
}
