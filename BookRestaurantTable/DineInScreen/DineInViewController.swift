//
//  BookingViewController.swift
//  Restaurants
//
//  Created by student on 15.04.21.
//

import UIKit
import SwiftUI

class DineInViewController: UIHostingController<DineInView> {
    private let viewModel = DineInViewModel()
    init(restaurant:Restaurant)
         {
           let view = DineInView(viewModel: viewModel)
          super.init(rootView: view)
           viewModel.controller = self
           viewModel.restaurant = restaurant
         }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func goToBack(){
        self.dismiss(animated: false, completion: {})
    }
    func goToSuccessfulBooking() {
        
       let vc = OrderSummaryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
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
