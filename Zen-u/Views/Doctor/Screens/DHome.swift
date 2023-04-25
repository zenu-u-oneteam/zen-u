//
//  DHome.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct DHome: View {
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Today is a good day")
                        .fontWeight(.light)
                        .foregroundColor(Color("Heading"))
                    Text("Dr. Weather")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("Heading"))
                }
                
                Spacer()

                ZStack{
                    
                    Circle().fill(Color("Secondary"))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "person.fill")
                        .font(.title2.weight(.light))
                }
            }
            
            //working shifts
            
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(Color("Secondary"))
                    .frame(width: .infinity, height: 60)
                    .cornerRadius(10)
                
                HStack{
                    Text("Working Hours")
                        .font(.callout.weight(.light))
                        .padding(.leading)
                    Spacer()
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.accentColor)
                        Text("09:00am - 04:00pm")
                            .foregroundColor(.accentColor)
                            .font(.callout.weight(.light))
                    }
                    .padding(.trailing)
                }
            }
            
            //today's agenda
            
            VStack(alignment: .leading){
                Text("Today's agenda")
                    .font(.title3.weight(.semibold))
                    .padding(.vertical, 10)
                
                HStack{
                    ZStack{
                        
                        VStack{
                            Text("16")
                                .font(.largeTitle.weight(.heavy))
                                .foregroundColor(.accentColor)
                            
                            Text("Total patients")
                                .font(.footnote.weight(.thin))
                        }
                        .frame(width: 95, height: 90)
                        .background(Color("Secondary"))
                        .cornerRadius(13)
                    }
                    
                    ZStack{
                        HStack{
                            VStack{
                                Text("08")
                                    .font(.largeTitle.weight(.heavy))
                                    .foregroundColor(Color("Heading"))
                                
                                Text("OPDs")
                                    .font(.footnote.weight(.thin))
                            }
                            Spacer()
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                            
                            VStack{
                                Text("06")
                                    .font(.largeTitle.weight(.heavy))
                                    .foregroundColor(Color("Heading"))
                                
                                Text("Meetings")
                                    .font(.footnote.weight(.thin))
                            }
                            Spacer()
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            Spacer()
                            VStack{
                                Text("02")
                                    .font(.largeTitle.weight(.heavy))
                                    .foregroundColor(Color("Heading"))
                                
                                Text("Operations")
                                    .font(.footnote.weight(.thin))
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                    .frame(width:.infinity, height: 90)
                    .background(Color("Secondary"))
                    .cornerRadius(13)
                    
                }
                // upcoming patient tile
                VStack(alignment: .leading){
                    Text("Upcoming patient")
                        .font(.title3.weight(.semibold))
                        .padding(.vertical, 10)
                        .foregroundColor(Color("Heading"))
                    
                    ZStack{
                        Rectangle()
                            .fill(Color("Secondary"))
                            .frame(width: .infinity, height: 140)
                            .cornerRadius(13)
                        
                        HStack{
                            VStack{
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 70, height: 70)
                                    Image("Image")
                                        .resizable()
                                        .frame(width: 55, height: 50)
                                }
                                .padding(.bottom,10)
                                ZStack{
                                    Text("New Patient")
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                }
                                .frame(width: 85, height: 22)
                                .background(.black.opacity(0.4))
                                .cornerRadius(5)
                            }
                            VStack(alignment: .leading){
                                Text("Jonathon Cole")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Heading"))
                                Text("28 years old")
                                    .font(.callout.weight(.thin))
                                Text("Male")
                                    .font(.callout.weight(.thin))
                            }
                            .padding(.top, -30)
                            
                            VStack(alignment: .trailing){
                                HStack{
                                    Image(systemName: "clock")
                                    Text("09:30")
                                        .font(.callout)
                                }
                                .foregroundColor(.accentColor)
                                .padding(.bottom, 65)
                                HStack{
                                    Text("See Details")
                                        .font(.footnote)
                                    Image(systemName: "chevron.right")
                                }
                                                                
                            }
                            .padding(.leading, 20)
                        }
                        
                    }
                }
                
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct DHome_Previews: PreviewProvider {
    static var previews: some View {
        DHome()
    }
}
