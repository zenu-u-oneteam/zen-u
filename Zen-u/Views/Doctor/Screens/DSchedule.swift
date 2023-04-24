//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI
let months = ["January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]
let days = [31, 28, 31 , 30 , 31 , 30 , 31, 31 , 30 , 31, 30 , 31]
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
                HStack{
                    VStack{
                        LazyVStack{
//                            ForEach(0...)
//
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
