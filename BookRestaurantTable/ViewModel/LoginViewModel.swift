//
//  LoginViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 19.04.2021.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    var controller: LoginViewController?
    
    @Published var email = ""
    @Published var password = ""
    @Published var isAuth: Bool = false
    
   
        
    func authFaild() {
        let alert = UIAlertController(title: "Auth failed", message: "Wrong email or password. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yeah", style: .default, handler: nil))
            self.controller!.present(alert, animated: true, completion: nil)
    }
    
    func signInButton() {
        if !email.isEmpty && !password.isEmpty {
            NetworkManager.shared.sendLoginData( email: email, password: password, completion: {
                                                        result in
                                                        switch result {
                                                        case .success (let user):
                                                            UserDefaults.standard.setValue(user.access_token, forKey: "access_token")
                                                            DispatchQueue.main.async {
                                                                self.controller!.authComplete()
                                                            }
                                                        case .failure(let error):
                                                            DispatchQueue.main.async {
                                                                self.authFaild()
                                                                return
                                                            }
                                                        }
                                                    })
        }
        else {
            authFaild()
        }
       
    }
    
}


