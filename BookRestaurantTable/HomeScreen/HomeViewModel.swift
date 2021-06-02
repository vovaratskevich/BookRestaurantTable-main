//
//  HomeViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    var controller: HomeViewController?
    @Published var foodCategories = [FoodCategory]()
    @Published var restaurants = [Restaurant]()
    private var cancellableFoodCategories: AnyCancellable?
    private var cancellableRestaurants:AnyCancellable?
    
    init() {
        
    }

    func fetchRestaurants() {
        cancellableRestaurants = NetworkManager.shared.fetchRestaurants()
            .sink(receiveCompletion: {_ in}, receiveValue: { item in
                    self.restaurants = item.data ?? []})
    }
    
    func fetchFoodCategories() {
        cancellableFoodCategories = NetworkManager.shared.fetchFoodCategories()
            .sink(receiveCompletion: {_ in}, receiveValue: { item in
                    self.foodCategories = item.data ?? []})
    }
}
