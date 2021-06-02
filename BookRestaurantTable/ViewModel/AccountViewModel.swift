//
//  AccountViewModel.swift
//  BookRestaurantTable
//
//  Created by user on 22.04.2021.
//

import Foundation
import Combine

final class AccountViewModel: ObservableObject {
    var controller: AccountViewController?
    @Published var user = User()
    
    private var cancellable:AnyCancellable?
    init() {
       cancellable = NetworkManager.shared.getUserDetails().sink(receiveCompletion: {_ in}, receiveValue: { item in
                                                                self.user = item})
    }
    
    func logOutButton() {
                UserDefaults.standard.setValue(nil, forKey: "access_token")
                self.controller!.goToSplashscreen()
            }
}
            
       
    
    
   

