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
    @State var path: NavigationPath = NavigationPath()
    @StateObject private var viewModel = ViewModel()
    @State private var showingSheet = false
    
    let items: [EducationTopics] = [
        EducationTopics(educationTitle: "Ayurveda and its benefits", educationContent: "Ayurveda is an ancient system of medicine that originated in India more than 5000 years ago. The word Ayurveda is derived from Sanskrit, and it means knowledge of life or science of life. It is based on the belief that health and wellness depend on a delicate balance between the mind, body, and spirit.", educzationImage: "ayurveda"),
        EducationTopics(educationTitle: "First aid during accidents", educationContent: "First aid is the initial care given to a person who has been injured or has fallen ill suddenly. It aims to preserve life, prevent the condition from worsening, and promote recovery. First aid should be administered as soon as possible after an accident or injury occurs, and before medical professionals arrive.i", educzationImage: "firstaid"),
        EducationTopics(educationTitle: "Improving Immunity", educationContent: "It is well known that a healthy immune system is vital for overall health and well-being. The immune system plays a critical role in protecting the body against infections, diseases, and other harmful substances. A strong immune system is better able to defend the body against infections and diseases, and also aids in faster recovery from illness. In contrast, a weakened immune system can leave the body vulnerable to infections and diseases, and can prolong the recovery process.", educzationImage: "immunity"),
        EducationTopics(educationTitle: "Daily Tips to Improve Heart's Health ", educationContent: "A daily morning empty stomach cardio serve as the best way to keep your heart healthy.Heart health is crucial to overall well-being as the heart plays a critical role in maintaining the proper functioning of the body. ", educzationImage: "heart")
    ]
    @State private var selectedItem: EducationTopics?
    
    var body: some View {
        
        NavigationStack(path: $path) {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        HStack(spacing:40){
                            Button{
                                showingSheet.toggle()
                            }
                        label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("Heading"))
                                .frame(width: 18,height: 18)
                                .background(Circle()
                                    .stroke(Color.white,lineWidth: 3)
                                    .background(Circle().fill(Color("Secondary")))
                                    .frame(width: 40,height: 40)
                                )
                        }
                        .sheet(isPresented: $showingSheet) {
                            PProfile()
                        }
                            VStack(alignment: .leading){
                                Text(viewModel.greeting)
                                    .font(.caption2)
                                Text(viewModel.userName)
                                    .font(.title3.bold())
                            }
                            Spacer()
                            
                            Button {
                                viewModel.emergencyCall()
                            } label: {
                                
                                Image(systemName: "phone.fill")
                                    .resizable()
                                    .foregroundColor(Color("Accent"))
                                    .frame(width: 20,height: 20.03)
                                    .background(Circle()
                                        .stroke(Color.white,lineWidth: 3)
                                        .background(Circle().fill(Color("Secondary")))
                                        .frame(width: 40,height: 40)
                                    )
                                    .padding(.leading)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                        
                        Text("How are you feeling today?")
                            .font(.largeTitle.weight(.semibold))
                            .padding(.horizontal, 20)
                    }
                    .background(Color("Secondary"))
                    
                    HStack(alignment: .center,spacing: 20) {
                        Spacer()
                        Button {
                            
                        } label: {
                            NavigationLink(destination: PConsultationAppointments()) {
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
                    .padding(.vertical, 30)
                    .background(Color("Secondary"))
                    .roundedCorner(50, corners: [.bottomLeft, .bottomRight])
                    
                    ScrollView {
                        if(viewModel.upcomingAppointments.count > 0) {
                            VStack(alignment: .leading,spacing: 20) {
                                Text("Upcoming Appointments")
                                    .font(.body.weight(.semibold))
                                    .padding(.top, 20)
                                ForEach(viewModel.upcomingAppointments.indices , id: \.self) { index in
                                    if(viewModel.upcomingAppointments[index].type?.category == "Consultation"){
                                        Button{
                                            
                                        }label: {
                                            NavigationLink(destination: PAppointmentDetailsUpcoming(appointmentDetails: viewModel.upcomingAppointments[index])){
                                                AppointmentCard(appointmentDetails: viewModel.upcomingAppointments[index], highlited: index == 0)
                                                
                                            }
                                        }
                                    } else {
                                        AppointmentCard(appointmentDetails: viewModel.upcomingAppointments[index], highlited: index == 0)
                                    }
                                    
   
                                    }
                                
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading,spacing: 20) {
                            Text("Patient Education")
                                .font(.body.weight(.semibold))
                                .padding(.leading, 24)
                                .padding(.top, 24)
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack(spacing: 20) {
                                    ForEach(items) { item in
                                        Rectangle()
                                            .foregroundColor(Color("Secondary"))
                                            .frame(width: 165, height: 100)
                                            .cornerRadius(20)
                                            .overlay(
                                                ZStack(alignment: .topLeading) {
                                                    Image(item.educzationImage)
                                                        .resizable()
                                                        .frame(width: 165, height: 100)
                                                        .cornerRadius(20)
                                                    Text(item.educationTitle).padding(4)
                                                        .frame(width: 165,height: 55)
                                                        .foregroundColor(.black)
                                                        .background(.thinMaterial)
                                                        .font(.headline.weight(.semibold))
                                                        .opacity(0.6)
                                                    Spacer()
                                                }.cornerRadius(20)
                                            )
                                            .onTapGesture {
                                                self.selectedItem = item
                                            }
                                    }
                                }
                                .padding(.horizontal, 20)
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
                        }
                        .hLeading()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
        .accentColor(Color("Accent"))
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
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
