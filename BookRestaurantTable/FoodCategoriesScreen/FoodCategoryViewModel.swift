//
//  HomeViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import Foundation
import Combine

final class FoodCategoryViewModel: ObservableObject {
    var controller: FoodCategoryViewController?
    @Published var foodCategories = [FoodCategory]()
    private var cancellableFoodCategories: AnyCancellable?
    
    init() {

    }
    
    func fetchFoodCategories() {
        cancellableFoodCategories = NetworkManager.shared.fetchFoodCategories()
            .sink(receiveCompletion: {_ in}, receiveValue: { item in
                    self.foodCategories = item.data ?? []})
    }
}
