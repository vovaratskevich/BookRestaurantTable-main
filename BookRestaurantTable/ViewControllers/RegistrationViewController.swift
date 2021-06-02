//
//  LoginViewController.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import UIKit
import Combine
import SwiftUI

class RegistrationViewController: UIHostingController<RegistrationView> {
    @Published var categories = [Category]()
    @Published var restaurants = [Restaurant]()
   // @Published var  favourites = [Restaurant]()
  //  @Published var isEmptyFavorite:Bool = true
    
    private var cancellableCategories: AnyCancellable?
    private var cancellableRestaurants:AnyCancellable?
   // private var cancellableFavourites:AnyCancellable?
    
    private let viewModel = RegistrationViewModel()
       init(){
        let view = RegistrationView(viewModel: viewModel)
        super.init(rootView: view)
        viewModel.controller = self

      }
    
    
    
    
    //func fetchCategories()
   // {
    //    cancellableCategories = APIRequest.shared.fetchCategories(page: 1)
     //       .sink(receiveCompletion: {_ in}, receiveValue: {item
                    
    //                in self.categories = item.data ?? []})
   // }
    func fetchRestaurants()
    {
        cancellableRestaurants = NetworkManager.shared.fetchRestaurants()
            .sink(receiveCompletion: {_ in}, receiveValue: { item in
                    self.restaurants = item.data ?? []})
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToLogin()
    {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = LoginViewController()
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func authComplete() {
            
            
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
    
    func goToMain()
    {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            
            let controller = UITabBarController()
           // controller.tabBar.
           //
            controller.tabBar.barTintColor = UIColor.white
            
            //let homeController = HomeViewController()
            //let homeNav = UINavigationController(rootViewController: homeController)
           // homeNav.navigationBar.isHidden = true
            
            //let ordersController = OrdersViewController()
            //let ordersNav = UINavigationController(rootViewController: ordersController)
           //ordersNav.navigationBar.isHidden = true
       
            
            //let accountController = AccountViewController()
           // let accountNav = UINavigationController(rootViewController: accountController)
          //  accountNav.navigationBar.isHidden = true
            
            
            //controller.setViewControllers([homeController,ordersController,accountController], animated: true)
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
