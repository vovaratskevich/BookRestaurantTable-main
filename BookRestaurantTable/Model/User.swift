//
//  User.swift
//  BookRestaurantTable
//
//  Created by user on 20.04.2021.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var firstName: String?
    var secondName: String?
    var email: String?
    var addressFull: String?
    var addressLat: String?
    var addressLon: String?
    var avatar: String?
    var emailVerifiedAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case secondName = "second_name"
        case email = "email"
        case addressFull = "address_full"
        case addressLat = "address_lat"
        case addressLon = "address_lon"
        case avatar = "avatar"
        case emailVerifiedAt = "email_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct UserResponse: Codable {
    var user: User
    var access_token: String
}

