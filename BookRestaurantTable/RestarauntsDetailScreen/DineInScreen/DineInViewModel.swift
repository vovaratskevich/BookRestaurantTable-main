//
//  BookingState.swift
//  Restaurants
//
//  Created by student on 12.04.21.
//

import Foundation
import Combine


final class DineInViewModel:ObservableObject{
    unowned var controller: DineInViewController?
    var restaurant = Restaurant()
    @Published var date:Date = Date()
    @Published var countPeople:Double = 1
    @Published var amountOfTime:Double = 0.5
    @Published var availableTime = [String]()
    @Published var selectedTime:String = ""
    @Published var isPresentDatePicker:Bool = false
   
    
    private var cancellable1:Set<AnyCancellable> = []
    private var cancellable2:Set<AnyCancellable> = []
    private var cancellable3:Set<AnyCancellable> = []
    
    init() {
        $date
            .debounce(for: 0.2, scheduler: RunLoop.main)
          .removeDuplicates()
            .flatMap
            { _ -> AnyPublisher<[String],Never> in
                self.selectedTime = ""
                
                return NetworkManager.shared.fetchAvailableTime(id: self.restaurant.id ?? 0, date: self.formatToString(date: self.date), people: self.countPeople, staying: self.amountOfTime)
            }
            .assign(to: \.availableTime, on: self)
            .store(in: &self.cancellable1)
        $countPeople
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap
            { _ -> AnyPublisher<[String],Never> in
                self.selectedTime = ""
                return  NetworkManager.shared.fetchAvailableTime(id: self.restaurant.id ?? 0, date: self.formatToString(date: self.date), people: self.countPeople, staying: self.amountOfTime)
            }
            .assign(to: \.availableTime, on: self)
            .store(in: &self.cancellable2)
        $amountOfTime
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap
            { _ -> AnyPublisher<[String],Never> in
                self.selectedTime = ""
                return NetworkManager.shared.fetchAvailableTime(id: self.restaurant.id ?? 0, date: self.formatToString(date: self.date), people: self.countPeople, staying: self.amountOfTime)
            }
            .assign(to: \.availableTime, on: self)
            .store(in: &self.cancellable3)
           

        
    }
    
    func formatToString(date:Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
//    func fetch ()
//    {
//                APIRequest.shared.fetchAvailableTime(id: restaurant.id ?? 0, date:date , people: countPeople, staying: amountOfTime)
//                {
//                    result in
//                    switch result
//                    {
//                    case .success (let time ):
//                        self.availableTime = time
//
//                    case .failure(let error):
//                        self.availableTime = ["No free table!"]
//
//                    }
//
//
//                }
//
//
//
//
//
//    }
    func handlerBooking()
    {
        
        NetworkManager.shared.reservation(id: restaurant.id ?? 0, date: self.formatToString(date: self.date), people: countPeople, staying: amountOfTime, time: selectedTime)
        {
            result in
            switch result
            {
            case .success ( _ ):
                DispatchQueue.main.async {
                    self.controller?.goToSuccessfulBooking()
                }
                
            case .failure( _):
                break
                
            }
        }
    }
    
    
    
}
