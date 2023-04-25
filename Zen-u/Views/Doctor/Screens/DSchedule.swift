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
    @State var selectedDate: Int = 0
    var body: some View {
         
        NavigationView(){
            VStack(){
                ScrollView(.horizontal) {
                            // 2
                            LazyHStack {
                                ForEach(0...11, id: \.self) {
                                    index in
                                    Button {
                                        self.selectedMonth = index
                                    } label: {
                                        Text(months[index]).foregroundColor(self.selectedMonth == index ? Color(buttonColor) : Color.gray).font(.system(size: 18, weight: .bold))
                                    }

                                    
                                        
                                }
                                    
                            }.frame(height: 20)
                }
                HStack{
                    ScrollView(.vertical){
                        LazyVStack( alignment: .leading, spacing: 10){
                            ForEach(0...days[selectedMonth] , id: \.self){
                                index in
                                Button {
                                    self.selectedDate = index
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12).fill(self.selectedDate == index ? Color(buttonColor) : Color.white)
                                        VStack {
                                            Text(String(index))
                                                .foregroundColor(self.selectedDate == index ? Color.white : Color.gray)
                                                .font(.system(size: 24))
                                            Text("Thrus")
                                                .font(.system(size: 16))
                                                .foregroundColor(self.selectedDate == index ? Color.white : Color.gray)
                                            
                                        }
                                       
                                    }.frame(width: 55 ,height: 70)
                                }

                            }
//
                        }
                    }.frame(width: 60)
                    ScrollView(.vertical) {
                                // 2
                                LazyVStack ( alignment: .leading, spacing: 10){
                                    ForEach(0...5, id: \.self) {
                                        index in
                                        Button {
                                            self.selectedMonth = index
                                        } label: {
                                            ZStack(alignment: .leading ){
                                                RoundedRectangle(cornerRadius: 20).fill(Color(color))
                                                VStack(alignment: .leading , spacing: 10){
                                                    HStack(alignment: .top , spacing : 40){
                                                        Text("9:30").font(.system(size: 34 , weight: .heavy)).foregroundColor(.black)
                                                        VStack(alignment: .leading , spacing: 4){
                                                            Text("Stefania Keller").font(.system(size: 16 , weight: .bold)).foregroundColor(.black)
                                                            Text("Age: 30 years").font(.system(size: 10 , weight: .light)).foregroundColor(.black)
                                                            Text("Gender: Female").font(.system(size: 10 , weight: .light)).foregroundColor(.black)
                                                        }
                                                    }
                                                    HStack {
                                                        TagLabel(labelText: "New Patient")
                                                        TagLabel(labelText: "OPD")
                                                        
                                                    }
                                                    
                                                }.padding(16)
                                            }
                                            
                                            .frame(width: 290)
                                        }

                                        
                                            
                                    }
                                        
                                }
                    }.frame(width: 300)
                    
                    
//                 Spacer()
                }
//                Spacer()
            }.padding(24)
            .navigationTitle("Schedule")
        }
    }
}

struct TagLabel: View {
    @State var labelText : String
    var body: some View {
        Text(labelText).font(.system(size: 8, weight: .semibold)).foregroundColor(.white)
            .padding(4)
            .background( RoundedRectangle(cornerRadius: 5).fill(Color.gray).frame(height: 16))
        
    }
}

struct FilterButton: View {
    @State var filterTypeText : String
    var body: some View {
        Button{} label: { Text(filterTypeText)
                .font(.system(size: 13 , weight: .semibold))
                .padding(16)
            .foregroundColor(.black).background(RoundedRectangle(cornerRadius: 50).fill(Color(color)).frame(height: 44)) }
    }
}

struct DSchedule_Previews: PreviewProvider {
    static var previews: some View {
        DSchedule()
    }
}
