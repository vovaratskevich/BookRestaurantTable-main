//
//  OrdersState.swift
//  Restaurants
//
//  Created by student on 15.04.21.
//

import Foundation
import Combine

final class OrdersViewModel:ObservableObject{
    unowned var controller: OrdersViewController?
    @Published var orders = [Order]()
     var numberPage:Int? = 1
    private var cancellableOrders: AnyCancellable?

    init() {
     
    
    }
    func cancelOrder(id:Int)
    {
       
        NetworkManager.shared.cancelOrder(id: id)
        {
            result in
            switch result
            {
            case .success ( _ ):
                DispatchQueue.main.async {
                    self.orders = self.orders.filter {$0.id != id}
                }
               
            case .failure( _):
            break
               
            }

        }
        
    }
    func fetchOrders()
    {
        cancellableOrders = NetworkManager.shared.fetchOrders(page: numberPage!)
                    .sink(receiveCompletion: {_ in}, receiveValue:
                            {
                                item in
                                self.orders.append(contentsOf: item.data ?? [])
                            }
                          )
        
    }
    
    
}
