//
//  LoginViewController.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import UIKit
import SwiftUI

class LoginViewController: UIHostingController<LoginView> {
    private let viewModel = LoginViewModel()
       init()
      {
        let view = LoginView(viewModel: viewModel)
        super.init(rootView: view)
        viewModel.controller = self

      }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goToRegistration() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = RegistrationViewController()
            
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func authComplete() {
            viewModel.isAuth = true
            
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
        
        func authFaild() {
            let alert = UIAlertController(title: "Auth failed", message: "Wrong email or password. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yeah", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        func authVerification(email: String, password: String) {
            if !viewModel.email.isEmpty && !viewModel.password.isEmpty {
                authComplete()
            } else {
                authFaild()
            }
        }
    
}

