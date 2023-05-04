//
//  PVaccineCard.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct PVaccineCard: View {
    var vaccineName: String
    var companyName: String?
    var numberOfAvailableDoses: String
    var Status : String
    var expanded: Bool = true
    var height: CGFloat = 75
  //  @State var isShowingPopover = false
    @State private var isModalPresented = false
    @State private var isShowingDetail = false
    
    var body: some View {
        
        if(expanded){
            expandedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        }
        else{
            collapsedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        }
    }
    
    
    func collapsedForm() -> some View
    {
        Button{
            isModalPresented = true
        }
    label: {
        //  NavigationLink(destination: Vdetails()){
        VStack(alignment: .center){
            
            VStack(alignment: .center) {
                Text(vaccineName)
                    .font(.headline.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .center) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline.weight(.bold))
            }
        }
        .frame(height: height)
        .padding()
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(10)
        .contextMenu(){
            Text("Book")
                .frame(minWidth: 230, minHeight: 60)
                .onLongPressGesture {
                 //   isModalPresented = true
                    isShowingDetail=true
                }
//                .popover(isPresented: $isShowingPopover) {
//
//                }
        }
        .sheet(isPresented: $isShowingDetail) {
            ModalView()
        }
        //  }
    }
    }
    
    
    func expandedForm() -> some View
    {
        Button{
            isModalPresented = true
        }
    label: {
        //     NavigationLink(destination: Vdetails()){
        HStack{
            
            VStack(alignment: .leading) {
                Text(vaccineName)
                    .font(.title2.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .center) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline)
            }
        }
        .frame(height: height)
        .padding()
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(10)
        .contextMenu(){
            Text("Book")
                .frame(height: height)
                .onLongPressGesture {
                   isShowingDetail = true
                }
               
        } .sheet(isPresented: $isShowingDetail) {
            ModalView()
        }
        
    }
    }
}

struct ModalView: View {
    var body: some View {
        Vdetails()
    }
}
//
//struct DetailView: View {
//    var body: some View {
//        //Vdetails()
//        Text("dkjfdk")
//    }
//}
//

struct PVaccineCard_Previews: PreviewProvider {
    static var previews: some View {
        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
    }
}

