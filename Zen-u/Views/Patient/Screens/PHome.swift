//
//  PatientHomeScreens.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct EducationTopics: Identifiable{
    let id = UUID()
    var educationTitle: String
    var educationContent: String
    var educzationImage: String
}

struct PHome: View {
    let items: [EducationTopics] = [
        EducationTopics(educationTitle: "Ayurveda and its benefits", educationContent: "ayurveda is the oldest blah blah bddbvyufvbiuvbfvbuuvbvubvvburvb vuinufbvduy usbvuysbivbu shujbvusvbisd subivu", educzationImage: "ayurveda"),
        EducationTopics(educationTitle: "First aid during accidents", educationContent: "Drive slowly, stay alert, you won't need first-aid", educzationImage: "firstaid"),
        EducationTopics(educationTitle: "Better the Immunity, Lesser the Diseases ", educationContent: "Immunity is the key to success ", educzationImage: "immunity"),
        EducationTopics(educationTitle: "Daily Tips to Improve Heart's Health ", educationContent: "A daily morning empty stomach cardio serve as the best way to keep your heart healthy.", educzationImage: "heart")
        
        
    ]
    @State private var selectedItem: EducationTopics?
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack(spacing:40){
                        Button{
                            
                        } label: {
                            NavigationLink(destination: PProfile()) {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("Heading"))
                                    .frame(width: 18,height: 18)
                                    .background(Circle()
                                        .stroke(Color.white,lineWidth: 3)
                                        .background(Circle().fill(Color("Secndary")))
                                        .frame(width: 40,height: 40)
                                    )
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text("Good Morning")
                                .font(.caption2)
                            Text("Reze")
                                .font(.title3.bold())
                        }
                        Spacer()
                        
                        Button(){
                            
                        }label: {
                            
                            Image(systemName: "phone.fill")
                                .resizable()
                                .foregroundColor(Color.blue)
                                .frame(width: 20,height: 20.03)
                                .background(Circle()
                                    .stroke(Color.white,lineWidth: 3)
                                    .background(Circle().fill(Color("Secndary")))
                                    .frame(width: 40,height: 40)
                                )
                                .padding(.leading)
                        }
                    }
                    .padding(.init(top: 80, leading: 30, bottom: 0, trailing: 30))
                    
                    Text("How are you feeling today?")
                        .font(.system(size: 41,weight: .semibold))
                        .padding(.horizontal, 24)
                    
                    HStack(alignment: .center,spacing: 20) {
                        Spacer()
                        Button {

                        } label: {
                            NavigationLink(destination: PBookingAppointments()) {
                                Text("Consult")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Heading"))
                                    .frame(width: 99,height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.white)
                                    )
                                    .font(.callout.weight(.semibold))
                            }
                        }
                        Button {
                            
                        } label: {
                            Text("Lab")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Heading"))
                                .frame(width: 68,height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                )
                                .font(.callout.weight(.semibold))
                        }
                        Button {
                            
                        } label: {
                            Text("Vaccination")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Heading"))
                                .frame(width: 128,height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                )
                                .font(.callout.weight(.semibold))
                        }
                        Spacer()
                    }
                }
                
                .background(Rectangle().foregroundColor(Color("Secondary"))
                    .frame(height: 344)
                    .cornerRadius(50))
                .ignoresSafeArea()
                
                VStack(alignment: .leading,spacing: 20) {
                    Text("Upcoming Appointments")
                        .font(.body.weight(.semibold))
                    
                    AppointmentCard(name: "PSV23 (Pneumo)", tags: ["General"], time: "9:30", doctorName: "Dr. Hanna Fiegel", highlited: true)
                    
                    AppointmentCard(name: "PSV23 (Pneumo)", tags: ["Vaccination"], time: "9:30", doctorName: "Dr. Hanna Fiegel")
                }
                .padding(.init(top: 0, leading: 24, bottom: 24, trailing: 24))
                
                Spacer()
                
                VStack(alignment: .leading,spacing: 20) {
                    Text("Patient Education")
                        .font(.body.weight(.semibold))
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 20) {
                            ForEach(items) { item in
                                Rectangle()
                                    .foregroundColor(Color("Secondary"))
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(20)
                                    .overlay(
                                        ZStack(alignment: .topLeading) {
                                            Image(item.educzationImage)
                                                .resizable()
                                                .frame(width: 200, height: 100)
                                                .cornerRadius(20)
                                            
                                            Text(item.educationTitle)
                                                .foregroundColor(.black)
                                                .background(.thinMaterial)
                                                .foregroundStyle(.secondary)
                                                .font(.headline .weight(.semibold))
                                            
                                            Spacer()
                                        }
                                    )
                                    .onTapGesture {
                                        self.selectedItem = item
                                    }
                            }
                        }
                    }
                    .sheet(item: $selectedItem) { item in
                        VStack {
                            Image(item.educzationImage)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .shadow(radius: 10)
                            
                            ZStack() {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("Secondary"))
                                
                                VStack{
                                    
                                    
                                    Text(item.educationTitle)
                                        .font(.headline)
                                        .padding()
                                    
                                    Text(item.educationContent)
                                        .font(.body)
                                        .padding()
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                    }
                }.hLeading()
                    .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 24))
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.large)
            .accentColor(Color("Accent"))
        }
    }
}

struct PatientHomeScreens_Previews: PreviewProvider {
    static var previews: some View {
        PHome()
    }
}


struct AppTypeTag: View {
    @State var labetText : String
    var body: some View {
        Text(labetText)
            .padding(8)
            .font(.system(size: 13,weight: .semibold))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .frame(height: 24)
            )
    }
}
