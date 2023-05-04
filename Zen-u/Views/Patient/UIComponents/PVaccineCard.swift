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
    @State var isShowingPopover = false
    
    var body: some View {
        
        if(expanded)
        {
            expandedForm()
            
        }
        else{
            collapsedForm()
        }
        
    }
    
    
    func collapsedForm() -> some View
    {
        Button{
            
        }
    label: {
        NavigationLink(destination: Vdetails()){
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
                        isShowingPopover = true
                    }
                    .popover(isPresented: $isShowingPopover) {
                        VStack {
                            Text("Popover title")
                                .font(.headline)
                            Text("Popover message")
                                .font(.subheadline)
                        }
                        .padding()
                    }
            }
        }
    }
    }
    
    
    func expandedForm() -> some View
    {
        Button{
            
        }
    label: {
        NavigationLink(destination: Vdetails()){
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
                        isShowingPopover = true
                    }
                    .popover(isPresented: $isShowingPopover) {
                        VStack {
                            Text("Popover title")
                                .font(.headline)
                            Text("Popover message")
                                .font(.subheadline)
                        }
                        .padding()
                    }
            }
        }
    }
    }
}
struct PVaccineCard_Previews: PreviewProvider {
    static var previews: some View {
        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
    }
}
