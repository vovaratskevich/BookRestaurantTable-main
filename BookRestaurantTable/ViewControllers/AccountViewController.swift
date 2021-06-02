//
//  AccountViewController.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import UIKit
import SwiftUI

class AccountViewController: UIHostingController<AccountView> {
    private let viewModel = AccountViewModel()
       init()
      {
        let view = AccountView(viewModel: viewModel, user: User())
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
    
    func goToBookingHistory() {
        
       let vc = BookingHistoryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        }
    
    func goToSplashscreen() {
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            let controller = SplashscreenViewController()
            
            sceneDelegate.window?.rootViewController = controller
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
