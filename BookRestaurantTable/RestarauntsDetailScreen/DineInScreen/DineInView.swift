//
//  BookingView.swift
//  Restaurants
//
//  Created by student on 8.04.21.
//

import SwiftUI

struct DineInView: View {
    
    @ObservedObject var viewModel: DineInViewModel
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Button(action:{self.viewModel.controller?.goToBack()})
                {
                    Image("closeIcon")
                        .resizable()
                        .frame(width:24,height: 24)
                }.foregroundColor(.black)
                
                Text("Book a table")
                    .bold()
                    .font(.title)
                    .padding(.bottom)
                
                
                VStack(alignment:.leading){
                    
                    Text("Reservation ID")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                    
                    Text("199029")
                        .padding(.bottom)
                    
                    HStack{
                        VStack(alignment:.leading){
                            Text("Expected date of arrival")
                                .foregroundColor(.gray)
                                .font(.system(size: 13))
                            Text(viewModel.formatToString(date: viewModel.date))
                                .padding(.bottom)
                        }
                        Spacer()
                        Button(action:{
                            viewModel.isPresentDatePicker.toggle()
                        }){
                            Image("calendarIcon2")
                        }.foregroundColor(.black)
                    }
                    
                }
                Text("Number of adults")
                MyStepperView(number:$viewModel.countPeople, maxNumber: 100, minNumber: 1, isInt:true)
                
                Text("How long will you be dining with us?")
                    .padding(.top)
                
                MyStepperView(number: $viewModel.amountOfTime, maxNumber: 24, minNumber: 0.5, step: 0.5, suffix:" h")
                
                AvailableTimeView(arrTime:viewModel.availableTime, selectedTime: $viewModel.selectedTime)
                
                HStack{
                    Spacer()
                    Button("Continue",action:
                            {viewModel.handlerBooking()}
                    )
                    .foregroundColor(.white)
                    .frame(width:226,height: 48)
                    .background( viewModel.selectedTime == "" ? Color("grayColor") : Color("colorBlue"))
                    .cornerRadius(24)
                    .padding()
                    .disabled( viewModel.selectedTime == "")
                    Spacer()
                }
                // Spacer()
            }.padding()
            if viewModel.isPresentDatePicker
            {
                DatePickerView(isPresentDatePicker: $viewModel.isPresentDatePicker, date: $viewModel.date)
            }
        }
    }
}
    
    struct BookingView_Previews: PreviewProvider {
        static var previews: some View {
            DineInView(viewModel: DineInViewModel())
        }
    }
    
    struct MyStepperView: View {
        @Binding var number:Double
        var maxNumber:Double = 10
        var minNumber:Double
        var step:Double = 1
        var suffix = ""
        var isInt = false
        var body: some View {
            Color("grayColor")
                .frame(height:48)
                .cornerRadius(24)
                .overlay(
                    HStack
                    {
                        Button( action:{
                                    if(self.number > minNumber){
                                        self.number -= step}})
                        {
                            Image(systemName: "minus")
                                .frame(width:24,height: 24)
                                .foregroundColor(.black)
                        }.padding(.leading)
                        .disabled(self.number == minNumber)
                        Spacer()
                        Text(isInt ? "\(Int(number))" : "\(number)" + suffix)
                        Spacer()
                        
                        Button( action:{
                                    if(self.number < maxNumber){
                                        self.number += step}})
                        {
                            Image(systemName: "plus")
                                .frame(width:24,height: 24)
                                .foregroundColor(.black)
                        }.padding(.trailing)
                        .disabled(self.number == maxNumber)
                       
                    }
                )
            
            
        }
    }

struct AvailableTimeView: View {
    var arrTime:[String]
    @Binding var selectedTime:String
    var body: some View {
        VStack(alignment:.leading){
        
        Text("Available reservation time")
            .padding(.top)
            ScrollView(.horizontal,showsIndicators:false)
            {
                LazyHStack{
                    ForEach(arrTime,id: \.self)
                    {
                        time in
                        Button(action:{
                            selectedTime = time
                            
                        }){
                            Text(time)
                                .padding()
                                .background( selectedTime == time ? Color.blue :  Color("grayColor"))
                                .frame(height: 48)
                                .cornerRadius(24)
                                .foregroundColor(selectedTime == time ? Color.white : Color.gray)
                        }
                        
                    }
                }
            }.frame(height:60)
        }
    }
}

struct DatePickerView: View {
    
    @Binding var isPresentDatePicker:Bool
    @Binding var date:Date
    var body: some View {
        VStack{
            
            DatePicker("", selection: $date, in: Date()... , displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
            
            Button("Ok",action:
                    {isPresentDatePicker.toggle()}
            )
            .foregroundColor(.white)
            .frame(width:226,height: 48)
            .background(Color("colorBlue"))
            .cornerRadius(24)
            .padding()
            
        }.background(Color.white)
        .border(Color.blue,width: 5)
        
    }
}
