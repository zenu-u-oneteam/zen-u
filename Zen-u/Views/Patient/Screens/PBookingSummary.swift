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
            HeaderView()
            Spacer(minLength: 60)
            BookingInfoView()
            Spacer(minLength: 100)
            PaymentView()
        }.padding(24)
    }
}
           
    
    func HeaderView()->some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 10){
                Text("Summary").font(.largeTitle.bold())
            }
            //.padding(.top,10)
            .hLeading()
        }
    }
    func BookingInfoView()->some View{
        VStack(spacing:20){
            Text("Booking Information")
                .hLeading()
                .font(.system(size: 20,weight: .semibold))
                .foregroundColor(Color(red: 30/255, green: 30/255, blue: 30/255))
            
            
            
            ZStack(alignment: .leading) {
                Rectangle()
                .foregroundColor(Color(red: 239/255, green: 239/255, blue: 239/255))
                .frame(width: 337,height: 104)
                .cornerRadius(26)
        
                HStack(spacing: 40){
                    Image(systemName: "calendar")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 20,height: 20)
                        .background(Circle().fill(.blue).frame(width: 54,height: 54))
                    
                    
                    VStack(alignment:.leading, spacing:5){
                        Text("Date and Time")
                            .foregroundColor(Color(red: 95/255, green: 91/255, blue: 91/255))
                            .font(.system(size: 16,weight: .bold))
                            .multilineTextAlignment(.leading)
                        Text("Thursday,1st July,2023").font(.system(size: 13,weight: .semibold)).multilineTextAlignment(.leading).foregroundColor(Color(red: 168/255, green: 166/255, blue: 166/255))
                        Text("7:30 PM").font(.system(size: 13,weight: .semibold)).multilineTextAlignment(.leading).foregroundColor(Color(red: 168/255, green: 166/255, blue: 166/255))
                    }
                }.padding(.leading,40)
                
            }
            Spacer()

            Text("Doctor Information")
                .hLeading()
                .font(.system(size: 20,weight: .semibold))
                .foregroundColor(Color(red: 30/255, green: 30/255, blue: 30/255))
            
            ZStack(alignment: .leading) {
                Rectangle()
                .foregroundColor(Color(red: 239/255, green: 239/255, blue: 239/255))
                .frame(width: 337,height: 104)
                .cornerRadius(26)
        
                HStack(spacing: 40){
                    Image(systemName: "calendar")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 20,height: 20)
                        .background(Circle().fill(.blue).frame(width: 54,height: 54))
                    
                    
                    VStack(alignment:.leading, spacing:5){
                        Text("Oncology Department")
                            .foregroundColor(Color(red: 95/255, green: 91/255, blue: 91/255))
                            .font(.system(size: 16,weight: .bold))
                            .multilineTextAlignment(.leading)
                        Text("Hospital Visit").font(.system(size: 13,weight: .semibold)).multilineTextAlignment(.leading).foregroundColor(Color(red: 168/255, green: 166/255, blue: 166/255))
                    }
                }.padding(.leading,40)
                
            }
            
            
            
        }
        
        
        
        
    }
    
    func PaymentView()-> some View{
        

        VStack(spacing: 10){
            HStack(){
                
                
                Text("Total Amount").fontWeight(.semibold).hLeading().padding().font(.system(size: 20))
                Text("INR 1299").fontWeight(.bold).foregroundColor(Color.blue).hTrailing().padding().font(.system(size: 20))
                
            }
                Button {
                    
                } label: {
                    Text("Pay Now")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        
                    
                        
                }.padding()
                .buttonStyle(.borderedProminent)
                        
                    
                }
            }
        
    
    
    struct PBookingSummary_Previews: PreviewProvider {
        static var previews: some View {
            PBookingSummary()
        }
    }

//    extension View{
//        func hLeading()->some View{
//            self
//                .frame(maxWidth: .infinity,alignment: .leading)
//        }
//        func hTrailing()->some View{
//            self
//                .frame(maxWidth: .infinity,alignment: .trailing)
//        }
//        func hCentre()->some View{
//            self
//                .frame(maxWidth: .infinity,alignment: .center)
//        }
//    }
    


