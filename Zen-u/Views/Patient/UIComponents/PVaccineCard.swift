//
//  PVaccineCard.swift
//  Zen-u
//
//  Created by Inzamam on 02/05/23.


import SwiftUI

struct PVaccineCard: View {
    var vaccineName: String
    var companyName: String?
    var numberOfAvailableDoses: String
    var Status : String
    var expanded: Bool = true
    var w: CGFloat? = 300
    var h: CGFloat? = 75
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
        VStack(alignment: .leading){
            
            VStack(alignment: .leading) {
                Text(vaccineName)
                    .font(.headline.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline.weight(.bold))
            }
        }
        .frame(height: h)
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(10)
        .contextMenu(){
            Text(" asfjka\ndsafjajs\nkajfkasj")
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
    
    
    func expandedForm() -> some View
    {
        HStack{
            
            VStack(alignment: .leading) {
                Text(vaccineName)
                    .font(.headline.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline.weight(.bold))
            }
        }
        .frame(width: w, height: h)
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(10)
        .contextMenu(){
            Text(" asfjka\ndsafjajs\nkajfkasj")
                .frame(width: w, height: h)
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
struct PVaccineCard_Previews: PreviewProvider {
    static var previews: some View {
        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
    }
}
