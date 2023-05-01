//
//  PBookingSummary.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PBookingSummary: View {
    var body: some View {
        VStack{
            BookingInfoView()
            Spacer()
            PaymentView()
        }
        .navigationTitle("Summary")
        .padding(24)
    }
}

func BookingInfoView() -> some View {
    VStack(spacing:20) {
        Text("Booking Information")
            .hLeading()
            .font(.title3.weight(.semibold))
            .foregroundColor(Color("Heading"))
        
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color("Secondary"))
                .frame(width: 337,height: 104)
                .cornerRadius(26)
            
            HStack(spacing: 40) {
                Image(systemName: "calendar")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 20,height: 20)
                    .background(Circle().fill(.blue).frame(width: 54,height: 54))
                
                VStack(alignment:.leading, spacing:5) {
                    Text("Date and Time")
                        .foregroundColor(Color("Subheadings"))
                        .font(.callout.weight(.semibold))
                        .multilineTextAlignment(.leading)
                    Text("Thursday,1st July,2023")
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Tag"))
                    Text("7:30 PM")
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("tag"))
                }
            }
            .padding(.leading,40)
        }
        .padding(.bottom, 40)
        
        Text("Doctor Information")
            .font(.title3.weight(.semibold))
            .foregroundColor(Color("Heading"))
            .hLeading()

        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color("Secondary"))
                .frame(width: 337,height: 104)
                .cornerRadius(26)
            
            HStack(spacing: 40) {
                Image(systemName: "person")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 20,height: 20)
                    .background(Circle().fill(Color("Accent")).frame(width: 54,height: 54))
                
                VStack(alignment:.leading, spacing:5) {
                    Text("Oncology Department")
                        .foregroundColor(Color("Subheadings"))
                        .font(.callout.weight(.semibold))
                        .multilineTextAlignment(.leading)
                    Text("Hospital Visit")
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Tag"))
                }
            }
            .padding(.leading,40)
        }
    }
}

func PaymentView() -> some View {
    
    VStack(spacing: 10){
        
        HStack(){
            Text("Total Amount")
                .fontWeight(.semibold)
                .hLeading()
                .font(.system(size: 20))
            Text("INR 1299")
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .hTrailing()
                .font(.system(size: 20))
        }
        .padding(.vertical)
        
        Button {
            print("Pay Now")
        } label: {
            NavigationLink(destination: PPayment()) {
                TabButton(text: "Pay Now")
            }
        }
    }
}

struct PBookingSummary_Previews: PreviewProvider {
    static var previews: some View {
        PBookingSummary()
    }
}
