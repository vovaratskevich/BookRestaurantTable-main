//
//  HomeViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import Foundation
import Combine

final class RestaurantsViewModel: ObservableObject {
    var controller: RestaurantsViewController?
    @Published var restaurants = [Restaurant]()
    private var cancellableRestaurants:AnyCancellable?
    
    init() {
        
    }
    
    func fetchRestaurants() {
        cancellableRestaurants = NetworkManager.shared.fetchRestaurants()
            .sink(receiveCompletion: {_ in}, receiveValue: { item in
                    self.restaurants = item.data ?? []})
    }
}
