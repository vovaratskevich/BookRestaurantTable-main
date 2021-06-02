//
//  OrdersViewController.swift
//  Restaurants
//
//  Created by student on 15.04.21.
//




import Foundation
import UIKit
import SwiftUI

class OrdersViewController: UIHostingController<OrdersView> {
    private let viewModel = OrdersViewModel()
       init()
      {
        let view = OrdersView(viewModel: viewModel)
       super.init(rootView: view)
      //  self.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(named: "bagIcon"),selectedImage: UIImage(named: "bagIcon.fill"))
        viewModel.controller = self
      }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.orders = []
        viewModel.numberPage = 1
        viewModel.fetchOrders()
       
    }
    
    //func goToRestaurant() {
    //   let vc = RestaurantViewController(restaurant: Restaurant())
     //   vc.modalPresentationStyle = .fullScreen
     //   self.present(vc, animated: false, completion: nil)
     //   }
    //

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
