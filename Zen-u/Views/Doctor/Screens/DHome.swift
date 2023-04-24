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
                        .fontWeight(.light).foregroundColor(Color( red: 0.11764705882352941, green: 0.11764705882352941, blue: 0.0))
                    Text("Dr. Weather").font(.largeTitle).fontWeight(.bold).foregroundColor(Color( red: 0.11764705882352941, green: 0.11764705882352941, blue: 0.0))
                }
                Spacer()
                //profile buttonz
                ZStack{

                    Circle().fill(.gray.opacity(0.1))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .light))
                }
            }
            
            //today's agenda
            
            VStack(alignment: .leading){
                Text("Today's agenda").fontWeight(.semibold).font(.title3).padding([.bottom, .top], 10)
                
                HStack{
                    ZStack{
                        
                        VStack{
                            Text("16").font(.largeTitle).fontWeight(.heavy).foregroundColor(.blue)
                            
                            Text("Total patients").fontWeight(.thin).font(.footnote)
                        }.frame(width: 100, height: 90).background(.gray.opacity(0.1)).cornerRadius(13)
                    }
                    
                    ZStack{
                        HStack{
                            VStack{
                                Text("08").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color( red: 0.11764705882352941, green: 0.11764705882352941, blue: 0.0))
                                
                                Text("OPDs").fontWeight(.thin).font(.footnote)
                                
                            }
                            Spacer()
                            
                            VStack{
                                Text("06").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color( red: 0.11764705882352941, green: 0.11764705882352941, blue: 0.0))
                                
                                Text("Meetings").fontWeight(.thin).font(.footnote)
                            }
                            Spacer()
                            VStack{
                                Text("02").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color( red: 0.11764705882352941, green: 0.11764705882352941, blue: 0.0))
                                
                                Text("Operations").fontWeight(.thin).font(.footnote)
                            }
                        }.padding([.leading, .trailing], 15)
                    }.frame(width:256, height: 90).background(.gray.opacity(0.1)).cornerRadius(13)
                    
                }
                // upcoming patient tile
                VStack(alignment: .leading){
                    Text("Upcoming patient").fontWeight(.semibold).font(.title3).padding([.bottom, .top], 10)
                    
                    ZStack{
                        HStack{
                            VStack{
                                ZStack{
                                    Circle().fill(.white)
                                        .frame(width: 70, height: 70)
                                    Image("Image").resizable().frame(width: 55, height: 50)
                                }.padding(.bottom,5)
                                ZStack{
                                    Text("New Patient").foregroundColor(.white).font(.footnote)
                                }.frame(width: 85, height: 22).background(.black.opacity(0.4)).cornerRadius(5)
                            }
                            VStack(alignment: .leading){
                                Text("Jonathon Cole").fontWeight(.bold)
                                Text("28 years old").font(.callout).fontWeight(.thin)
                                Text("Male").font(.callout).fontWeight(.thin)
                                
                            }.padding(.top, -30)
                            VStack(alignment: .trailing){
                                HStack{
                                    Image(systemName: "clock").foregroundColor(.blue)
                                    Text("09:30").font(.callout).foregroundColor(.blue)
                                }.padding(.bottom, 80)
                                Text("See Details").font(.footnote)
                                
                            }.padding(.leading, 35)
                        }
                        
                    }.frame(width: 360, height: 140).background(.gray.opacity(0.1)).cornerRadius(13)
                }
                
            }
            Spacer()
        }.padding([.trailing, .leading], 15)
        
    }
}



struct DHome_Previews: PreviewProvider {
    static var previews: some View {
        DHome()
    }
}
