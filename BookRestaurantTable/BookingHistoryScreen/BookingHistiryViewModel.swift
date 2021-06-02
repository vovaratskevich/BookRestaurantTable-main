//
//  BookingHistoryScreen.swift
//  Restaurants
//
//  Created by student on 15.04.21.
//

import Foundation
import Combine

final class BookingHistoryViewModel:ObservableObject{
  unowned  var controller: BookingHistoryViewController?
   @Published var orders = [Order]()
    private var cancellable:AnyCancellable?
    init() {
   
    }
    
    func fetchOrders() {
        cancellable = NetworkManager.shared.fetchBookingHistory()
            .sink(receiveCompletion: {_ in}, receiveValue: {
                        item in
                        self.orders.append(contentsOf: item.data ?? [Order]())
                    })
    }
  
}
