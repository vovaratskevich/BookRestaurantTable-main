//
//  HomeViewController.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import UIKit
import SwiftUI
import Combine


class RestaurantsDetailViewController: UIHostingController<RestarauntsDetailsView> {
    private let viewModel = RestaurantsDetailViewModel()
       init(restaurant:Restaurant)
      {
        let view = RestarauntsDetailsView(viewModel: viewModel)
        super.init(rootView: view)
        viewModel.controller = self
        viewModel.restaurant = restaurant
      }
    
    override func viewDidAppear(_ animated: Bool) {
        //viewModel.fetchCategories()
       // viewModel.fetchFavourites()
      //  viewModel.fetchRestaurants()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToDineIn(restaurant:Restaurant) {
        
        let vc = DineInViewController(restaurant:restaurant)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        }
    
    func goToHome() {
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                let tabController = UITabBarController()
                let home = HomeViewController()
                let orders = OrdersViewController()
                let account = AccountViewController()
                
                home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeBarIcon"), selectedImage: UIImage(systemName: "homeActiveBarIcon"))
                orders.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(named: "ordersBarIcon"), selectedImage: UIImage(systemName: "ordersActiveBarIcon"))
                account.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "accountBarIcon"), selectedImage: UIImage(systemName: "accountActiveBarIcon"))
                
                //tabController.tabBar.tintColor = UIColor(.white)
                tabController.setViewControllers([home,orders,account], animated: true)
                //let controllers = [home, orders, account]
                //tabController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
                
                
                sceneDelegate.window?.rootViewController = tabController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
  
}
