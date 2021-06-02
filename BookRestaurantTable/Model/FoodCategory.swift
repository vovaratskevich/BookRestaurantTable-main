//
//  FoodCategory.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import Foundation

struct FoodCategory: Codable, Identifiable {
    var id:Int?
    var name:String?
    var image_url:String?
    
    func getImageURL() -> String {
        return "http://dev2.cogniteq.com:3110" + "/"  + (image_url ?? "")
    }
}

struct FoodCategoryResponse: Codable {
    var data:[FoodCategory]?
}
