//
//  HomeViewController.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import SwiftUI
import Combine


class HomeViewController: UIHostingController<HomeView> {
    private let viewModel = HomeViewModel()
    
    init() {
        let view = HomeView(viewModel: viewModel)
        super.init(rootView: view)
        viewModel.controller = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.fetchRestaurants()
        viewModel.fetchFoodCategories()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToRestaraunt(restaurant: Restaurant) {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = RestaurantsDetailViewController(restaurant: restaurant)
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func goToRestaraunts() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = RestaurantsViewController()
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func goToFoodCategories() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = FoodCategoryViewController()
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
