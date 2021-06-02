//
//  Order.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import Foundation

struct Order: Identifiable, Codable {
    var id:Int?
    var status:String?
    var price:String?
    var date:String?
    var people:Int?
    var staying:Int?
    var time:String?
    var staying_end:String?
    var user_id:Int?
    var place_id:Int?
    var place:Restaurant?
}

struct OrderResponse: Codable {
    var data:[Order]?
}
