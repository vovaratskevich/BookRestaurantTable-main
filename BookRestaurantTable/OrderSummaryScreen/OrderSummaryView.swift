//
//  OrderSummaryView.swift
//  BookRestaurantTable
//
//  Created by user on 16.04.2021.
//

import SwiftUI

struct OrderSummaryView: View {
    @ObservedObject var viewModel: OrderSummaryViewModel
    var body: some View {
        VStack (spacing: 0){
           
            
                HStack{
                    Button(action:{
                        // What to perform
                    })
                    {
                        Image(uiImage: #imageLiteral(resourceName: "Union"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                }
                .padding(.leading)
            
            Spacer()
            VStack () {
                Image(uiImage: #imageLiteral(resourceName: "Frame 107"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
            }
            .padding(.bottom, 25)

            VStack() {
                    Text("The table has been booked")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)

                    Text("We’ll wait for you on time.")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 250)
            
            Button(action: {
                // What to perform
                viewModel.controller?.goToHome()
            }) {
                Text("Continue")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(width: 194, alignment: .top)
                .lineSpacing(22)
                .padding(.horizontal, 16)
                .padding(.vertical, 13)
                .frame(width: 226, height: 48)
                .background(Color(red: 0.24, green: 0.49, blue: 1))
                .cornerRadius(24)
                .shadow(radius: 16, y: 8)
            }
            
            
            
        }
        
        .padding(.top)
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .background(Color.white)
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(viewModel: OrderSummaryViewModel())
    }
}
