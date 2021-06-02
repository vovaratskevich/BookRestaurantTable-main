//
//  APIError.swift
//  BookRestaurantTable
//
//  Created by user on 17.05.2021.
//

import Foundation

enum APIError: Error {
  case encode(EncodingError)
  case request(URLError)
  case decode(DecodingError)
  case unknown
}
