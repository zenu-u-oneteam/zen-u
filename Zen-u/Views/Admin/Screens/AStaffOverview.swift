//
//  AdminStaffOverview.swift
//  Zen-u
//
//  Created by Debarghya Barik on 27/04/23.
//

import SwiftUI

struct AdminStaffOverview: View {
//    var deptList = ["Medical", "Nursing", "Sanitation", "Pathology", "IT", "Security"]
//    var deptDesc = ["Details of doctors categorised based on their specialised departments.", "Details of nursing staff categorised  on the departments they are currently working under.", "Details of sanitation workers and staff dispersed through the campus.", "Cool ones.", "Details of Security Personnel on campus."]
    var body: some View {
        NavigationStack {
            VStack() {
                //total overview of staff
                HStack {
                    ZStack{
                        VStack{
                            Text("16")
                                .font(.largeTitle.weight(.heavy))
                                .foregroundColor(.accentColor)
                            
                            Text("Active Staff")
                                .font(.footnote.weight(.bold))
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
                                
                                Text("Doctors")
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
                                
                                Text("Nurses")
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
                                
                                
                                Text("Sanitation")
                                    .font(.footnote.weight(.thin))
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                    .frame(width:.infinity, height: 90)
                    .background(Color("Secondary"))
                    .cornerRadius(13)
                }
                
                //Departments details
                ScrollView{
                    ForEach(0..<6)
                    {
                        numberOfCapsule in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading)
                                
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("Medical Department")
                                        .frame(width: 163, height: 22)
                                        .font(.system(size: 17).weight(.semibold))
                                    
                                    Text("Details of Doctors categorised based on their specialised departments")
                                        .frame(width: 257, height: 40)
                                        .font(.system(size: 15).weight(.regular))
                                        .foregroundColor(.gray)
                                }
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color(UIColor.tertiaryLabel))
                                    .padding()
                                
                                Spacer()
                            }
                        }
                        Divider()
                            .frame(width: 314)
                    }.padding(.top, 13)
                }
                .frame(width: 360, height: 500
                )
                .background(Color("Secondary"))
                .cornerRadius(10)
                .padding(.vertical, 20)
            }
            .navigationBarTitle("Staff")
            .padding()
        }
    }
}

struct AdminStaffOverview_Previews: PreviewProvider {
    static var previews: some View {
        AdminStaffOverview()
    }
}
