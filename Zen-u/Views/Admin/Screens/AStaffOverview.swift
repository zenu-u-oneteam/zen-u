//
//  AdminStaffOverview.swift
//  Zen-u
//
//  Created by Debarghya Barik on 27/04/23.
//

import SwiftUI

struct dept: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}
func departmentView(for department: dept) -> some View {
    return
    VStack{
        HStack {
            Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text(department.name)
                    .font(.headline.weight(.semibold))

                Text(department.description)
                    .font(.subheadline.weight(.regular))
                                        .foregroundColor(Color("Tag"))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        Divider()
    }
}

struct AdminStaffOverview: View {
    
    var departments: [dept] = [
        dept(name: "Medical", description: "Details of doctors categorised based on their specialised departments."),
        dept(name: "Nursing", description: "Details of nursing staff categorised by current department of work."),
        dept(name: "Sanitation", description: "Details of sanitation workers and staff dispersed through the campus."),
        dept(name: "Pathology", description: "Details on Blood Bank and other Laboratory Tests."),
        dept(name:  "IT", description: "Details of Technical workforce"),
        
        dept(name: "Security", description: "Details of security personnel on campus.")
    ]
    
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
                Spacer()
                
                VStack(spacing: 0){
                    ScrollView{
                        ForEach(departments) { dept in
                            
                            departmentView(for: dept)
                            
                        }
                    }
                }.padding()
                    .frame(width: 360, height: 500)
                    .background(Color("Secondary"))
                    .cornerRadius(20)
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

