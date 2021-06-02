//
//  RegistrationViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//
import Foundation
import SwiftUI

final class RegistrationViewModel: ObservableObject {
    
    var controller: RegistrationViewController?
    @Published var firstName = ""
    @Published var secondName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordSecond = ""
    
    
    func authFaild() {
        let alert = UIAlertController(title: "Auth failed", message: "Wrong email or password. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yeah", style: .default, handler: nil))
            self.controller!.present(alert, animated: true, completion: nil)
    }
    
    func signUpButton() {
        if !email.isEmpty && !password.isEmpty && !passwordSecond.isEmpty && !firstName.isEmpty && !secondName.isEmpty {
            NetworkManager.shared.sendRegistrationData(firstName:firstName,secondName:secondName,email:email,password:password) {
                                                        result in
                                                        switch result {
                                                        case .success (_):                                                           
                                                            DispatchQueue.main.async {
                                                                self.controller!.goToLogin()
                                                            }
                                                        case .failure(let error):
                                                            DispatchQueue.main.async {
                                                                self.authFaild()
                                                                return
                                                            }
                                                        }
                                                    }
        }
        else {
            authFaild()
        }
       
    }
    
    
}

