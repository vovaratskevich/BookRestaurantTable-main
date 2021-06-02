import Foundation
import SwiftUI

class OrderSummaryViewController: UIHostingController<OrderSummaryView> {
    private let viewModel = OrderSummaryViewModel()
       init() {
        let view = OrderSummaryView(viewModel: viewModel)
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
