//
//  NetworkManager.swift
//  BookRestaurantTable
//
//  Created by user on 12.05.2021.
//

import Foundation

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    public static let shared = NetworkManager()
    //@Published var items = [User]()
    //private let url = URL(string: API.dataResource.rawValue + API.prefixKeyAPI.rawValue + API.keyAPI.rawValue)!
  
        
       // func getUser() -> AnyPublisher<[User], Error> {
         //  else {return}
            
           // URLSession.shared.dataTask(with: url) { (data, _, -) in }
           // let  users = try! JSONDecoder().decode([User].self, from: data!)
        //}
    
    func sendLoginDataRequest (email: String, password: String) -> AnyPublisher <User, APIError> {
      return Just(User()).eraseToAnyPublisher()
        .encode(encoder: JSONEncoder())
        .mapError { error -> APIError in
          if let encodingError = error as? EncodingError {
            return .encode(encodingError)
          } else {
            return .unknown
          }
      }
      .map { data -> URLRequest in
        let url = URL(string: "http://dev2.cogniteq.com:3110/api/login")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = data
        return urlRequest
      }
        .flatMap {
        URLSession.shared.dataTaskPublisher(for: $0)
          .mapError(APIError.request)
          .map(\.data)
          .decode(type: User.self, decoder: JSONDecoder())
          .mapError { error -> APIError in
            if let decodingError = error as? DecodingError {
              return .decode(decodingError)
            } else {
              return .unknown
            }
        }
      }
      .eraseToAnyPublisher()
    }
    
    func sendLoginData (email:String,password:String, completion: @escaping (Result<UserResponse, Error>) -> ()) {
           let parameters = ["email":email,"password":password] as [String : Any]
           //create the url with URL
           guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/login") else {return}//change the url
           //create the session object
           let session = URLSession.shared
           //now create the URLRequest object using the url object
           var request = URLRequest(url: url)
           request.httpMethod = "POST" //set http method as POST
           do {
               request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
           } catch let error {
               print(error.localizedDescription)
           }
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else {
                   return
               }
               guard let data = data else {
                   return
               }
               do {
                  let json = try JSONDecoder().decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json))
                    }
               }
               
               catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                }
               }
            
           })
           task.resume()
        }
    
    func getUserDetails() -> AnyPublisher<User, Never> {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/user/details")
        else { return Just(User()).eraseToAnyPublisher() }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
          .mapError(APIError.request)
          .map(\.data)
          .decode(type: User.self, decoder: JSONDecoder())
          .replaceError(with: User())
          .eraseToAnyPublisher()
    }
    
    func sendRegistrationData (firstName:String,secondName:String,email:String,password:String,completion: @escaping(Result<Bool,Error>) -> ()) {
           let parameters = ["first_name":firstName,"second_name":secondName,"email":email,"password":password] as [String : Any]
           guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/register") else {return}
           let session = URLSession.shared
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           do {
               request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
           } catch let error {
               print(error.localizedDescription)
           }
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else {
                   return
               }
               guard let httpResponse = response as? HTTPURLResponse
               else {
                    return
               }
            
                switch httpResponse.statusCode
                    {
                        case 201: completion(.success(true))
                        default:  completion(.failure(APIError.unknown))
                    }
                
           })
           task.resume()
        }
    
    func sendDataForRegistration( name:String,surname:String,email:String,password:String,completion: @escaping(Result<Bool,APIError>)->Void)
    {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/register") else {return}
        let parameters = ["first_name":name,"second_name":surname,"email":email,"password":password]
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        urlRequest.httpBody = try?
            JSONEncoder().encode(parameters)
        
        let dataTask = URLSession.shared.dataTask(with:urlRequest)
        {
            data,response,error in
            guard   error == nil
            else
            {
                completion(.failure(APIError.unknown))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse
            else { completion(.failure(APIError.unknown))
                return
            }
            
            switch httpResponse.statusCode
            {
            case 201: completion(.success(true))
            case 422: completion(.failure(APIError.unknown))
            default:  completion(.failure(APIError.unknown))
            }
        }
        dataTask.resume()
        
    }
    
    func fetchRestaurants() -> AnyPublisher<RestaurantResponse, Never> {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/places")
        else{ return Just(RestaurantResponse()).eraseToAnyPublisher()  }
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: RestaurantResponse.self, decoder:  JSONDecoder())
            .replaceError(with: RestaurantResponse())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchOrders(page:Int) -> AnyPublisher<OrderResponse, Never> {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/orders?active")
        else{ return Just(OrderResponse()).eraseToAnyPublisher()  }
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
        .map(\.data)
        .decode(type: OrderResponse.self, decoder:  JSONDecoder())
        .replaceError(with: OrderResponse() )
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    func cancelOrder(id:Int,completion: @escaping(Result<Bool,APIError>)->Void)
    {
        guard let url = Endpoint.cancel(id: id).absoluteURL else {return}
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let dataTask = URLSession.shared.dataTask(with:urlRequest)
        {
            data,response,error in
            guard   error == nil
            else
            {
                completion(.failure(APIError.unknown))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse
            else { completion(.failure(APIError.unknown))
                return
            }
            switch httpResponse.statusCode
            {
            case 200: completion(.success(true))
            default:  completion(.failure(APIError.unknown))
            }
        }
        dataTask.resume()
    }
    
    func fetchBookingHistory() -> AnyPublisher<OrderResponse, Never> {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/orders?history")
        else{ return Just(OrderResponse()).eraseToAnyPublisher()  }
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
        .map(\.data)
        .decode(type: OrderResponse.self, decoder:  JSONDecoder())
        .replaceError(with: OrderResponse())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()    
    }
    
    func fetchFoodCategories() -> AnyPublisher<FoodCategoryResponse, Never> {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/categories")
        else { return Just(FoodCategoryResponse()).eraseToAnyPublisher()  }
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
        .map(\.data)
        .decode(type: FoodCategoryResponse.self, decoder:  JSONDecoder())
        .replaceError(with: FoodCategoryResponse())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
     }
    
    func fetchAvailableTime(id: Int, date: String, people: Double, staying: Double) -> AnyPublisher<[String],Never>
    {
        guard let url = Endpoint.availableTime(id: id).absoluteURL
        else{ return Just([String]()).eraseToAnyPublisher()  }
        let parameters = ["date":date,"people":String(people),"staying":String(staying)]
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try?  JSONEncoder().encode(parameters)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: [String].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func reservation(id:Int,date:String,people:Double,staying:Double,time:String, completion: @escaping(Result<Bool,APIError>)->Void)
    {
        guard let url = Endpoint.reservation(id: id).absoluteURL
        else{ return  }
        let parameters = ["date":date,"people":String(people),"staying":String(staying),"time":time]
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "access_token")!, forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = try?  JSONEncoder().encode(parameters)
        let dataTask = URLSession.shared.dataTask(with:urlRequest)
        {
            data,response,error in
            guard   error == nil
            else
            {
                completion(.failure(APIError.unknown))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse
            else { completion(.failure(APIError.unknown))
                return
            }
            switch httpResponse.statusCode
            {
            case 200: completion(.success(true))
            default:  completion(.failure(APIError.unknown))
            }
        }
        dataTask.resume()
    }
}
    
   

