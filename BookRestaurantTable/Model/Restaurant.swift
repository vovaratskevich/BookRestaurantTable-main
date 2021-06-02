//
//  Restaurant.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import Foundation

struct Restaurant: Codable,Identifiable {
    var id:Int?
    var name:String?
    var image_url:String?
    var rating:Double?
    var address_full:String?
    var address_lat:Double?
    var address_lon:Double?
    var phone:String?
    var description:String?
    var capacity:Int?
    var table_price:String?
    var reviewsCount:Int?
    var favourite:Bool?
    
    func getImageURL() -> String {
        return "http://dev2.cogniteq.com:3110/" + (image_url ?? "")
    }
}

struct RestaurantResponse: Codable {
    var data:[Restaurant]?
}
