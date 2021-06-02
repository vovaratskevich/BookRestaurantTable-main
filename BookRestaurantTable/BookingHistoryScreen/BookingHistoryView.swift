//
//  BookingHistoryView.swift
//  Restaurants
//
//  Created by student on 8.04.21.
//

import SwiftUI

struct BookingHistoryView: View {
    @ObservedObject var viewModel:BookingHistoryViewModel
    
    var body: some View {
        VStack{
            ZStack{
                HStack
                {
                    Button(action:{self.viewModel.controller?.goToBack()})
                    {
                        Image("Union")
                            .resizable()
                            .frame(width:24,height: 24)
                    }.foregroundColor(.black)
                    Spacer()
                }.padding(.leading)
                Text("Booking history")
                    .bold()
            }
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.orders){
                        order in
            OrderHistoryView(order: order)
                .onAppear
                {
                }
                        Divider()
                            .padding(.leading)
                    }
                    
                }
            }
        }
    }
}

struct BookingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BookingHistoryView(viewModel: BookingHistoryViewModel())
    }
}

struct OrderHistoryView: View {
    var order = Order()
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("ID" + "\(order.id ?? 000)")
                    .font(.system(size: 17))
                    .bold()
                Spacer()
                Text("$" + (order.price ?? ""))
                    .foregroundColor(.blue)
            }
            HStack{
                Image( "calendarIcon")
                    .resizable()
                    .frame(width:16,height: 16)
                    .padding(.trailing,5)
                Text(order.date ?? "")
                    .font(.system(size: 13))
            }
            HStack{
                Image("guestsIcon")
                    .resizable()
                    .frame(width:16,height: 16)
                    .padding(.trailing,5)
                Text("\(order.people ?? 0)" + " Persons")
                    .font(.system(size: 13))
            }.padding(.top,1)
            
            HStack{
                Image(uiImage: order.place?.getImageURL().loadImage() ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:72,height: 72)
                    .cornerRadius(16)
                
                VStack(alignment:.leading, spacing:0){
                    
                    Text(order.place?.name ?? "")
                        .bold()
                        .padding(.bottom,5)
                        .padding(.top,5)
                    
                    HStack(spacing:0){
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width:13,height: 13)
                            //.padding(.trailing)
                        
                        
                        Text(String(format:"%.01f" , order.place?.rating ?? 5.0))
                            .font(.system(size: 13))
                        Text("(" + "\(order.place?.reviewsCount ?? 0)" + ")")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.top,0)
                    
                    Spacer()
                }.padding(.leading)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
    }
}
