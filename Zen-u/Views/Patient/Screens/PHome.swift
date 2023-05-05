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
    var educationAuthor: String
    var educationSub: String
    var educationSubContent: String
    var authorInfo: String
}

struct PHome: View {
    @State var path: NavigationPath = NavigationPath()
    @StateObject private var viewModel = ViewModel()
    @State private var showingSheet = false
    
    let items: [EducationTopics] = [
        EducationTopics(educationTitle: "Ayurveda and its benefits", educationContent: "Ayurveda is an ancient system of medicine that originated in India more than 5000 years ago. The word Ayurveda is derived from Sanskrit, and it means knowledge of life or science of life. It is based on the belief that health and wellness depend on a delicate balance between the mind, body, and spirit.", educzationImage: "ayurveda", educationAuthor: "-Dr. Shaantanu Pathak",educationSub:"The Koshas: Feeding the Five Layers of Your Being", educationSubContent: "The word “kosha” means “sheath,” which is a helpful visualization of what the koshas are: five sheaths nested inside each other, moving from a “gross” layer on the outside to increasingly more subtle layers deeper inside.Their existence is not linear or exclusive, though it may be easier to access certain koshas at different times or for different people depending on their practices, experiences, or state of mental, physical, and spiritual health.While it may seem like the innermost, subtlest kosha is the “best,” or the “goal” of working with them, that’s not the case. Just like vata, pitta, and kapha are doshas we all have and need to survive, all of the koshas serve an important function and are in an interdependent relationship with one another.The outer, gross layer offers a kind of protection for the subtler layers, while the subtle layers can motivate and inspire our beliefs and actions that manifest in the world through our gross, or physical, activities.",authorInfo: "(Bachelor of Ayurvedic Medicine and Surgery)"),
        EducationTopics(educationTitle: "First aid during accidents", educationContent: "First aid is the initial care given to a person who has been injured or has fallen ill suddenly. It aims to preserve life, prevent the condition from worsening, and promote recovery. First aid should be administered as soon as possible after an accident or injury occurs, and before medical professionals arrive.i", educzationImage: "firstaid", educationAuthor: "-Dr.Shriya Garg",educationSub:"First Aid - things you should not do", educationSubContent: "As mentioned earlier, if you are involved in an accident, do not try to help others unless you are sure that you are fine and have not sustained any severe injuries. If the victim is wearing a helmet and you notice bleeding from the head, do not try to remove the helmet. There is a good chance that the helmet is helping block the bleeding and keeping the skull in place. Also, in cases of neck injuries, the helmet provides some support and trying to remove it might cause irreparable damage to the neck, which is a susceptible area. During accidents, people tend to prop the neck of the victim up, where they sometimes even try to make them sit up. Now, while a thin layer of cushion under the head is OK to comfort the victim, propping the head up overly blocks the airway and causes difficulty for the victim to breathe. Don't try to prop the victim’s head up or make them sit, especially if you are not a trained paramedic. Wait for medical help to arrive and let the paramedics take care of such victims. Similarly, if you find something pierced or lodged in any part of the body, do not try to remove it. The person will start bleeding profusely if the object is removed. Do not move the victim if you suspect a neck or spinal injury. Let them be in the position they are in. Just keep speaking to them and try to keep them awake. You will know if their neck or spine is in an abnormal position. Do not feed the victims any food or pour water into their mouth unless they explicitly ask for it and appear fit to consume it. If the victim is breathing correctly, can speak, and asks for water, you can probably allow a small sip or two at a time. If the victim isn’t explicitly asking for water, pouring it in might end up choking them. Do not allow too many bystanders to huddle around the victim, as it creates a sense of claustrophobia and panic. Ask people to stand at a distance and ensure that the victim is in an airy environment. However, morally binding it may appear at the moment, do not perform CPR on the victim if you are not trained for the procedure. You might end up causing more harm than good to the victim by doing such a thing. To sum it up, be calm, keep your wits about the situation, co-operate, coordinate, call for help immediately and do the best you can to help the victims till help arrives.", authorInfo: "(Red Cross Certified First-Aid Trainer)"),
        EducationTopics(educationTitle: "Improving Immunity with Daily Habits", educationContent: "It is well known that a healthy immune system is vital for overall health and well-being. The immune system plays a critical role in protecting the body against infections, diseases, and other harmful substances. A strong immune system is better able to defend the body against infections and diseases, and also aids in faster recovery from illness. In contrast, a weakened immune system can leave the body vulnerable to infections and diseases, and can prolong the recovery process.", educzationImage: "immunity",educationAuthor: "-Dr. Kruti Sharma", educationSub: "Immune System and age", educationSubContent: "As we age, our immune response capability becomes reduced, which in turn contributes to more infections and more cancer. As life expectancy in developed countries has increased, so too has the incidence of age-related conditions. While some people age healthily, the conclusion of many studies is that, compared with younger people, the elderly are more likely to contract infectious diseases and, even more importantly, more likely to die from them. Respiratory infections, including, influenza, the COVID-19 virus and particularly pneumonia are a leading cause of death in people over 65 worldwide. No one knows for sure why this happens, but some scientists observe that this increased risk correlates with a decrease in T cells, possibly from the thymus atrophying with age and producing fewer T cells to fight off infection. Whether this decrease in thymus function explains the drop in T cells or whether other changes play a role is not fully understood. Others are interested in whether the bone marrow becomes less efficient at producing the stem cells that give rise to the cells of the immune system. A reduction in immune response to infections has been demonstrated by older people's response to vaccines. For example, studies of influenza vaccines have shown that for people over age 65, the vaccine is less effective compared to healthy children (over age 2). But despite the reduction in efficacy, vaccinations for influenza and S. pneumoniae have significantly lowered the rates of sickness and death in older people when compared with no vaccination. There appears to be a connection between nutrition and immunity in the elderly. A form of malnutrition that is surprisingly common even in affluent countries is known as micronutrient malnutrition. Micronutrient malnutrition, in which a person is deficient in some essential vitamins and trace minerals that are obtained from or supplemented by diet, can happen in the elderly. Older people tend to eat less and often have less variety in their diets. One important question is whether dietary supplements may help older people maintain a healthier immune system. Older people should discuss this question with their doctor. ", authorInfo: "(Ph.Din Nutrition)"),
        EducationTopics(educationTitle: "Daily Tips to Improve Heart's Health ", educationContent: "A daily morning empty stomach cardio serve as the best way to keep your heart healthy.Heart health is crucial to overall well-being as the heart plays a critical role in maintaining the proper functioning of the body. ", educzationImage: "heart", educationAuthor: "-Dr. Aarush Mehta", educationSub: "Your Heart can be trained ", educationSubContent: "very day, your heart pumps about 2,000 gallons of blood, delivering essential nutrients and oxygen to cells and organs throughout the body. This is an incredible amount of work for a muscle about the size of your fist – the easier you can make your heart’s job, the longer it can keep you alive.Practicing heart-healthy lifestyle modifications can dramatically reduce the risk of heart disease, which is the No. 1 cause of death among men and women in the U.S. But when we recommend lifestyle changes, we’re not suggesting that you should run five miles a day or eat nothing but salads. Daily, mindful decisions about what you eat and how you move can reduce your heart’s workload and your risk of developing coronary artery disease, hypertension, and heart failure. Little changes today can result in big benefits over time. I frequently borrow an analogy from a mentor: Think of your health as a retirement account. If you consistently save a little bit over a long period time, it grows, and you reap the financial benefits later in life. When it comes to heart health, success starts with creating healthy habits you can sustain long term. UT Southwestern’s General Cardiology, Preventive Cardiology, and Family Medicine teams can help you assess the lifestyle factors outside your control – where you live, how easy it is to get fresh foods, etc. – and create realistic goals to improve your heart health.Several of our physicians are certified by the American College of Lifestyle Medicine and can help patients focus on their overall health by adjusting daily habits such as diet, exercise, sleep, and stress management.Patients often find success by starting with five diet changes and five exercise tips that are attainable and can be personalized to your unique needs and fitness level.", authorInfo: "(Internal Medicine- Cardiology)")
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
                            NavigationLink(destination: PLabTestBooking()) {
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
                        }
                        Button {
                            
                        } label: {
                            NavigationLink(destination: PVaccinationBooking()) {
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
                                ScrollView{
                                    VStack {
                                        Image(item.educzationImage)
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .shadow(radius: 10)
                                        
                                        ZStack() {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color("Secondary"))
                                            
                                            VStack(spacing: 30){
                                                
                                                Text(item.educationTitle)
                                                    .font(.title .weight(.bold))
                                                    .hCenter()
                                                VStack{
                                                    Text(item.educationAuthor)
                                                        .font(.caption .weight(.semibold))
                                                        .hTrailing()
                                                    Text(item.authorInfo)
                                                        .font(.caption .weight(.semibold))
                                                        .hTrailing()
                                                }
                                                
                                                Text(item.educationContent)
                                                    .font(.body)
                                                    //.padding()
                                                Text (item.educationSub)
                                                    .font(.title .weight(.bold))
                                                Text (item.educationSubContent)
                                                    .font(.body)
                                                    //.padding()
                                                
                                                Spacer()
                                                
                                            }.padding(8)
                                        }
                                    }
                                    .padding()
                                    
                                }

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
