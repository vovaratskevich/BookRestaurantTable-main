//
//  SplashscreenViewController.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import UIKit
import SwiftUI

class SplashscreenViewController: UIHostingController<SplashscreenView> {
    private let state = SplashscreenState()
        init(){
        let view = SplashscreenView(state:state)
        super.init(rootView: view)
        state.controller = self

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
}
