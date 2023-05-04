import SwiftUI


struct PLabTestBooking: View {
    var test = ["Blood", "Pregnancy", "X-Ray", "Ultrasound"]
    var testImages = ["blood_test", "pregnancy_image", "x_ray", "UltraSound"]
    var VitalOrganTest = ["Heart", "Kidney", "Liver"]
    var VitalOrganTestImage = ["heart_image", "kidney_image", "liver_image"]
    @State private var selectedRecommendedCardIndex: Int?
    @State private var selectedVitalOrganCardIndex: Int?
    @State private var searchText = ""

    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack(spacing: 20) {
                HStack(){
                    Text("Recommended").font(.title3.weight(.semibold))
                    Spacer()
                    Button(action: {
                    }, label: {
                        NavigationLink(destination: PLabTestRecommended()){
                            ViewButton(text: "View All", selectable: true)
                        }
                    })
                }
                PLabTestcard(Testname: test, Testimage: testImages, viewAll: false, selectedCardIndex: $selectedRecommendedCardIndex)
                    .onChange(of: selectedRecommendedCardIndex) { newValue in
                        if newValue != nil {
                            selectedVitalOrganCardIndex = nil
                        }
                    }
                    
                VStack(spacing: 20) {
                    HStack() {
                        Text("Vital Organs").font(.title3.weight(.semibold))
                        Spacer()
                        Button(action: {}, label: {
                            NavigationLink(destination: PLabTestVitalOrgans()) {
                                ViewButton(text: "View All", selectable: true)
                            }
                        })
                    }
                    PVitalOrganTestcard(VitalOrganTestname: VitalOrganTest, VitalOrganTestimage: VitalOrganTestImage, viewAll: false, selectedCardIndex: $selectedVitalOrganCardIndex)
                        .onChange(of: selectedVitalOrganCardIndex) { newValue in
                            if newValue != nil {
                                selectedRecommendedCardIndex = nil
                            }
                        }
                }


            }.padding(.horizontal, 15)

            VStack(spacing: -15){
                HStack(){

                    Text("Popular Health Packages").font(.title3.weight(.semibold))
                    Spacer()
                    Button(action: {}, label: {
                        NavigationLink(destination: PLabTestExpansion()){
                            ViewButton(text: "View All", selectable: true)}
                    })
                }.padding(24)

                PLabTestExpansionCard(tName: "Complete Blood Count (CBC)", testType: "Package", tDuration: "1 day", tPrice: "1299")


            }
            Button(action: {}, label: {
                if selectedRecommendedCardIndex != nil || selectedVitalOrganCardIndex != nil {
                    NavigationLink(destination: PLabTestDetails()) {
                        TabButton(text: "Continue")
                    }
                }
            })
        }

        .navigationTitle("Booking Lab Tests")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchText)
    }
}

struct PLabTestBooking_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestBooking()
    }
}
