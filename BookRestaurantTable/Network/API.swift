//
//  API.swift
//  BookRestaurantTable
//
//  Created by user on 18.05.2021.
//

import Foundation

enum Endpoint {
    
    case login, registration, logOut,userInfo
    case categories(page:Int)
    case restaurantsByCategory(id:Int,page:Int)
    case restaurants(page:Int)
    case favourites(page:Int)
    case orders(page:Int)
    case bookingHistory(page:Int)
    case restaurant(id:Int)
    case changeFavourite(id:Int)
    case cancel(id:Int)
    case reservation(id:Int)
    case availableTime(id:Int)
    case schedule(id:Int)
    case searchRestaurants(name:String,page:Int)
   
    
    var baseURL:URL {URL(string:"http://dev2.cogniteq.com:3110")!}
    
    func path() -> String {
        switch self {
        case .login:
            return "/api/login"
        case .registration:
            return "/api/register"
        case .logOut:
            return "/api/logout"
        case .categories(_):
            return "/api/categories"
        case .userInfo:
            return "/api/user/details"
        case .restaurants(_):
            return "/api/places"
        case .restaurantsByCategory(let id,_):
            return "/api/categories/\(id)/places"
        case .favourites(_):
            return "/api/user/favourites"
        case .orders(_):
            return "/api/orders"
        case .bookingHistory(_):
            return "/api/orders"
        case .restaurant(let id):
            return "/api/places/\(id)"
        case .changeFavourite(_):
        return "/api/user/favourites"
        case .cancel(let id):
            return "/api/orders/\(id)"
        case .reservation(let id):
            return "/api/places/\(id)/reserve"
        case .availableTime(let id):
            return "/api/places/\(id)/reservation"
        case .schedule(let id):
            return "/api/places/\(id)/schedule"
        case .searchRestaurants(_, _):
            return "/api/places"
        }
        
    }
    
    var absoluteURL: URL? {
        let queryURL = baseURL.appendingPathComponent(self.path())
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else {
            return nil
        }
        switch self {
        case .categories(let page) :
            urlComponents.queryItems = [URLQueryItem(name: "page", value:"\(page)" )]
        case .restaurants(let page) :
            urlComponents.queryItems = [URLQueryItem(name: "page", value:"\(page)" )
            ]
        case .restaurantsByCategory(_,let page) :
            urlComponents.queryItems = [URLQueryItem(name: "page", value:"\(page)" )]
        case .favourites(let page) :
            urlComponents.queryItems = [URLQueryItem(name: "page", value:"\(page)" )]
        case .orders(let page) :
            urlComponents.queryItems = [
                URLQueryItem(name: "active", value:nil )
                ,URLQueryItem(name: "page", value:"\(page)" )
            ]
        case .bookingHistory(let page) :
            urlComponents.queryItems = [
                URLQueryItem(name: "history", value:nil )
                ,URLQueryItem(name: "page", value:"\(page)" )
            ]
        case .changeFavourite(let id) :
            urlComponents.queryItems = [URLQueryItem(name: "place", value:"\(id)" )]
        case .searchRestaurants(let name, let page):
            urlComponents.queryItems = [
                URLQueryItem(name: "name", value:name )
                ,URLQueryItem(name: "page", value:"\(page)" )
            ]
        default:
           break
            
        }
        return urlComponents.url
    }
    
}
