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
    var educationSub2: String
    var educationSC2: String
}

struct PHome: View {
    @State var path: NavigationPath = NavigationPath()
    @StateObject private var viewModel = ViewModel()
    @State private var showingSheet = false
    
    let items: [EducationTopics] = [
        EducationTopics(educationTitle: "Ayurveda and its benefits", educationContent: "Ayurveda is an ancient system of medicine that originated in India more than 5000 years ago. The word Ayurveda is derived from Sanskrit, and it means knowledge of life or science of life. It is based on the belief that health and wellness depend on a delicate balance between the mind, body, and spirit.", educzationImage: "ayurveda", educationAuthor: "-Dr. Shaantanu Pathak",educationSub:"The Koshas: Feeding the Five Layers of Your Being", educationSubContent: "The word “kosha” means “sheath,” which is a helpful visualization of what the koshas are: five sheaths nested inside each other, moving from a “gross” layer on the outside to increasingly more subtle layers deeper inside.Their existence is not linear or exclusive, though it may be easier to access certain koshas at different times or for different people depending on their practices, experiences, or state of mental, physical, and spiritual health.While it may seem like the innermost, subtlest kosha is the “best,” or the “goal” of working with them, that’s not the case. Just like vata, pitta, and kapha are doshas we all have and need to survive, all of the koshas serve an important function and are in an interdependent relationship with one another.The outer, gross layer offers a kind of protection for the subtler layers, while the subtle layers can motivate and inspire our beliefs and actions that manifest in the world through our gross, or physical, activities.",authorInfo: "(Bachelors in Ayurvedic Medicine and Surgery)",educationSub2: "Working with the Koshas: Listening and Love ",educationSC2: "Unlike the concept of individual sheaths that are their namesake, the koshas are not clearly divided or discrete from one another. This makes it somewhat challenging to know which one needs tending to.As you become more and more aware of the koshas, you may wonder, are my emotions (manomaya kosha) making me crave junk food, or is my physical body (annamaya kosha) truly hungry? Will tapping into the oneness of the universe (anandamaya kosha) give me energy, or am I simply tired because I’m thinking too much (vijnanamaya kosha)? Only you know the answers. With practice and patience, our ability to feel and know what we need becomes more and more second nature. Or perhaps, more accurately, first nature.In the end, we want to feed all the koshas some form of love. When digested and absorbed, this nourishment for the subtle body allows us to love ourselves, each other, and the world with more intensity and depth. As the poet E. E. Cummings wrote, “Love is the whole and more than all.” "),
        EducationTopics(educationTitle: "First aid during accidents", educationContent: "First aid is the initial care given to a person who has been injured or has fallen ill suddenly. It aims to preserve life, prevent the condition from worsening, and promote recovery. First aid should be administered as soon as possible after an accident or injury occurs, and before medical professionals arrive.i", educzationImage: "firstaid", educationAuthor: "-Dr.Shriya Garg",educationSub:"Dont's during First Aid", educationSubContent: "As mentioned earlier, if you are involved in an accident, do not try to help others unless you are sure that you are fine and have not sustained any severe injuries. If the victim is wearing a helmet and you notice bleeding from the head, do not try to remove the helmet. There is a good chance that the helmet is helping block the bleeding and keeping the skull in place. Also, in cases of neck injuries, the helmet provides some support and trying to remove it might cause irreparable damage to the neck, which is a susceptible area. During accidents, people tend to prop the neck of the victim up, where they sometimes even try to make them sit up. Now, while a thin layer of cushion under the head is OK to comfort the victim, propping the head up overly blocks the airway and causes difficulty for the victim to breathe. Don't try to prop the victim’s head up or make them sit, especially if you are not a trained paramedic. Wait for medical help to arrive and let the paramedics take care of such victims.", authorInfo: "(Red Cross Certified First-Aid Trainer)", educationSub2:"Do's during First Aid", educationSC2: "Firstly, if you have been involved in an accident and have taken an impact, check yourself for injuries and bleeding first. When you meet with an accident, you might experience a sudden adrenaline rush, which significantly increases your tolerance to pain. This means that you might not even fully know that you are hurt and might still make normal movements without any sensation of pain. You must check yourself thoroughly for any cuts or bruises and feel your body parts for any pain or injury by dabbing on them with your hands. If you are fine and notice other victims around you, call the ambulance and police immediately before attending to others. If you are stuck in or under a vehicle or have fallen into a pit, call loudly for help. Make your presence heard so that help can arrive as early as possible. While making noise is necessary when you are stuck in your mind, try to stay calm, as you will need to conserve energy and make quick decisions while help arrives.If you are not involved in the accident and have merely witnessed it, make sure you first have a good look at the scene of the accident. Don’t rush at the first victim you come across. First, make sure that you do whatever it takes to mitigate the chances of accident and injury to other road users around the accident scene. Alert those around you to the apparent hazards, and prevent the situation from worsening."),
        EducationTopics(educationTitle: "Improving Immunity with Daily Habits", educationContent: "It is well known that a healthy immune system is vital for overall health and well-being. The immune system plays a critical role in protecting the body against infections, diseases, and other harmful substances. A strong immune system is better able to defend the body against infections and diseases, and also aids in faster recovery from illness. In contrast, a weakened immune system can leave the body vulnerable to infections and diseases, and can prolong the recovery process.", educzationImage: "immunity",educationAuthor: "-Dr. Kruti Sharma", educationSub: "Immune System and age", educationSubContent: "As we age, our immune response capability becomes reduced, which in turn contributes to more infections and more cancer. As life expectancy in developed countries has increased, so too has the incidence of age-related conditions. While some people age healthily, the conclusion of many studies is that, compared with younger people, the elderly are more likely to contract infectious diseases and, even more importantly, more likely to die from them. Respiratory infections, including, influenza, the COVID-19 virus and particularly pneumonia are a leading cause of death in people over 65 worldwide. No one knows for sure why this happens, but some scientists observe that this increased risk correlates with a decrease in T cells, possibly from the thymus atrophying with age and producing fewer T cells to fight off infection.", authorInfo: "(Ph.D in Nutrition)",educationSub2:"Diet and Immunity",educationSC2: "Like any fighting force, the immune system army marches on its stomach. Healthy immune system warriors need good, regular nourishment. Scientists have long recognized that people who live in poverty and are malnourished are more vulnerable to infectious diseases. For example, researchers don't know whether any particular dietary factors, such as processed foods or high simple sugar intake, will have adversely affect immune function. There are still relatively few studies of the effects of nutrition on the immune system of humans.There is some evidence that various micronutrient deficiencies — for example, deficiencies of zinc, selenium, iron, copper, folic acid, and vitamins A, B6, C, and E — alter immune responses in animals, as measured in the test tube. However, the impact of these immune system changes on the health of animals is less clear, and the effect of similar deficiencies on the human immune response has yet to be assessed."),
        EducationTopics(educationTitle: "Daily Tips to Improve Heart's Health ", educationContent: "A daily morning empty stomach cardio serve as the best way to keep your heart healthy.Heart health is crucial to overall well-being as the heart plays a critical role in maintaining the proper functioning of the body. ", educzationImage: "heart", educationAuthor: "-Dr. Aarush Mehta", educationSub: "Your Heart can be trained ", educationSubContent: "very day, your heart pumps about 2,000 gallons of blood, delivering essential nutrients and oxygen to cells and organs throughout the body. This is an incredible amount of work for a muscle about the size of your fist – the easier you can make your heart’s job, the longer it can keep you alive.Practicing heart-healthy lifestyle modifications can dramatically reduce the risk of heart disease, which is the No. 1 cause of death among men and women in the U.S. But when we recommend lifestyle changes, we’re not suggesting that you should run five miles a day or eat nothing but salads. Daily, mindful decisions about what you eat and how you move can reduce your heart’s workload and your risk of developing coronary artery disease, hypertension, and heart failure. Little changes today can result in big benefits over time.", authorInfo: "(Internal Medicine - Cardiology)", educationSub2: "Impact: daily Habits", educationSC2:"Little changes today can result in big benefits over time. I frequently borrow an analogy from a mentor: Think of your health as a retirement account. If you consistently save a little bit over a long period time, it grows, and you reap the financial benefits later in life. When it comes to heart health, success starts with creating healthy habits you can sustain long term. UT Southwestern’s General Cardiology, Preventive Cardiology, and Family Medicine teams can help you assess the lifestyle factors outside your control – where you live, how easy it is to get fresh foods, etc. – and create realistic goals to improve your heart health. Several of our physicians are certified by the American College of Lifestyle Medicine and can help patients focus on their overall health by adjusting daily habits such as diet, exercise, sleep, and stress management.")
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
                                                Text (item.educationSub)
                                                    .font(.title .weight(.bold))
                                                Text (item.educationSubContent)
                                                    .font(.body)
                                                Text(item.educationSub2)
                                                    .font(.title .weight(.bold))
                                                Text(item.educationSC2)
                                                    .font(.body)
                                                
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
