//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

var color = #colorLiteral(red: 0.9625412822, green: 0.9625412822, blue: 0.9625412822, alpha: 1)
var hintTextColor = #colorLiteral(red: 0.7137254902, green: 0.7019607843, blue: 0.7019607843, alpha: 1)
var doctorTypeBgColor = #colorLiteral(red: 0.09411764706, green: 0.4666666667, blue: 0.9490196078, alpha: 1)
var buttonColor = #colorLiteral(red: 0.1882352941, green: 0.5333333333, blue: 1, alpha: 1)

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
                }.padding(.bottom, 8)
                HStack{
                    ScrollView(.vertical){
                        LazyVStack( alignment: .leading, spacing: 10){
                            ForEach(1...days[selectedMonth] , id: \.self){
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
                                            TaskCard()
                                        }
                                    }
                                        
                                }
                    }.frame(width: 300)
                    
//
                }
                HStack(spacing : 20){
                    FilterButton(filterTypeText: "OPD")
                    FilterButton(filterTypeText: "Operation")
                    FilterButton(filterTypeText: "Meeting")
                }.padding(8)
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
        Button{} label: { ZStack {
            RoundedRectangle(cornerRadius: 50).fill(Color(.black))
            Text(filterTypeText)
                .font(.system(size: 14 , weight: .semibold)).foregroundColor(.white)
                .padding(16)
                .foregroundColor(.black)
        }.frame(width: 105 , height: 40 )
        }
    }
    
}
struct TaskCard: View {
    var body: some View {
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

struct DSchedule_Previews: PreviewProvider {
    static var previews: some View {
        DSchedule()
    }
}
