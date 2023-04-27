//
//  PHealthRecords.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import SwiftUI

struct PHealthRecords: View {
    var tableHeadings: [HealthRecordType]
    @State private var ButtonClicked = "Prescriptions"
    var body: some View {
        VStack{
            
            //            HeaderView().padding(.all, 10)
            //                .padding(.top, 30)
            //                Spacer(minLength: 60)
            VStack(alignment: .leading){
                Text("All Health Documents").font(.system(size: 20)).bold()
                    .hLeading()
                    .padding(.all, 20)
                    .padding(.top, 40)
                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                ZStack{
                    Rectangle()
                        .frame(width: 346, height: 340)
                        .foregroundColor(Color("Secondary"))
                        .cornerRadius(15)
                        .hLeading()
                        .padding(.horizontal,20)
                    
                    VStack(alignment: .leading, spacing: 16){
                       
                        ForEach(tableHeadings, id: \.self) { item in
                            Button {
                                
                                ButtonClicked = item.title
                                print(ButtonClicked)
                                
                            } label: {
                                HStack(alignment: .center, spacing: 12){
                                    
                                    Image(systemName: item.image).resizable()
                                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading){
                                        Text(item.title).font(.system(size: 17)).bold()
                                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                            .padding(1)
                                        Text(item.description).font(.system(size: 15)).foregroundColor(Color.gray)
                                        
                                    }
                                    Image(systemName: "chevron.right").foregroundColor(Color.gray).padding(.leading, 35)
                                    
                                    //                                        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                                    //                                                }

                                }.padding(.leading, 10)//tableviewcell
                                
                            }   
                            Divider().frame(width: 314)
                                .padding(.leading, 30)
                        }
                    }//tableView
                }          
            }
            Spacer(minLength: 200)
            
        }//main VStack
    }
    func HeaderView() -> some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Health Records").font(.largeTitle.bold())
                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .padding(.all, 10)
            }
            .hLeading()
        }// end of HeaderView() function
    }
    
    struct DetailView: View {
        var body: some View {
            Text("Detail view")
        }
    }
    struct PHealthRecords_Previews: PreviewProvider {
        static var previews: some View {
            var sectionHeadings : [HealthRecordType] = [
                HealthRecordType(id: 1, title: "Prescriptions", category: .prescription, image: "stethoscope.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: 2, title: "Lab Reports", category: .labreports, image: "doc.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: 3, title: "Vaccination Reports", category: .vaccinationreports, image: "syringe.fill" , description: "All your details in one place"),
                HealthRecordType(id: 4, title: "Hospitalizations", category: .hospitalization, image: "bed.double.circle.fill" , description: "All your details in one place")
            ]
            PHealthRecords(tableHeadings: sectionHeadings)
        }
    }
    
}
