//
//  BookingHistoryViewController.swift
//  Restaurants
//
//  Created by student on 15.04.21.
//


import UIKit
import SwiftUI

class BookingHistoryViewController: UIHostingController<BookingHistoryView> {
    private let viewModel = BookingHistoryViewModel()
       init()
      {
       
        let view = BookingHistoryView(viewModel:viewModel)
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
    
    override func viewDidAppear(_ animated: Bool) {
       
        viewModel.fetchOrders()
    }
    
    func goToBack(){
        self.dismiss(animated: false, completion: {})
    }
    
    func goToRestaurant() {
        
       let vc = RestaurantsDetailViewController(restaurant: Restaurant())
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

