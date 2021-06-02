//
//  SceneDelegate.swift
//  BookRestaurantTable
//
//  Created by user on 01.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        if UserDefaults.standard.string(forKey: "access_token") != nil
        {
            let tabController = UITabBarController()
            let home = HomeViewController()
            let orders = OrdersViewController()
            let account = AccountViewController()
            
            home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeBarIcon"), selectedImage: UIImage(systemName: "homeActiveBarIcon"))
            orders.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(named: "ordersBarIcon"), selectedImage: UIImage(systemName: "ordersActiveBarIcon"))
            account.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "accountBarIcon"), selectedImage: UIImage(systemName: "accountActiveBarIcon"))
            
            tabController.setViewControllers([home,orders,account], animated: true)
            let currentWindow = UIWindow(windowScene: sceneWindow)
            currentWindow.rootViewController = SplashscreenViewController()
            self.window = currentWindow
            currentWindow.makeKeyAndVisible()
            window?.rootViewController = tabController
            window?.makeKeyAndVisible()
        }
        else {
            let currentWindow = UIWindow(windowScene: sceneWindow)
            currentWindow.rootViewController = SplashscreenViewController()
            self.window = currentWindow
            currentWindow.makeKeyAndVisible()
        }
        
       
        /*
        let currentWindow = UIWindow(windowScene: sceneWindow)
         
         let tabController = UITabBarController()
         
                 let home = HomeViewController()
                 let orders = OrdersViewController()
                 let more = MoreViewController()
                 
                 home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "home"), tag: 0)
                 orders.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "orders"), tag: 1)
                 more.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "more"), tag: 2)
         
                 let controllers = [home, orders, more]
                 tabController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
         
        currentWindow.rootViewController = SplashScreenViewController()
        self.window = currentWindow
        currentWindow.makeKeyAndVisible()
 
        */
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

