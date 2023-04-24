//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI
let months = ["January" , "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]
struct DSchedule: View {
    @State var selectedMonth: Int = 0
    
    var body: some View {
         
        NavigationView(){
            VStack{
                ScrollView(.horizontal) {
                            // 2
                            LazyHStack {
                                ForEach(0...11, id: \.self) {
                                    index in
                                    Button {
                                        self.selectedMonth = index
                                    } label: {
                                        Text(months[index]).foregroundColor(self.selectedMonth == index ? Color(buttonColor): Color.gray)
                                    }

                                    
                                        
                                }
                                    
                            }
                }.frame(height: 20)
                VStack{
                    HStack{
                        ScrollView(.vertical) {
                                    // 2
                                    LazyVStack {
                                        ForEach(1...31, id: \.self) { index in
                                        
                                                
                                                }
                                            
                                    }
                                }
                    }
                }
                Spacer()
            }.padding(24)
            .navigationTitle("Schedule")
        }
    }
}

struct DSchedule_Previews: PreviewProvider {
    static var previews: some View {
        DSchedule()
    }
}
