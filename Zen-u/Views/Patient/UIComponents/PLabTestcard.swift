import SwiftUI



import SwiftUI

var selectedTestName: String?

func PLabTestcard(Testname: [String], Testimage: [String], viewAll: Bool, selectedCardIndex: Binding<Int?>) -> some View {
    
    let testCount = viewAll ? Testname.count : min(Testname.count, 3)
    let rows = (testCount + 2) / 3
    let columns = min(testCount, 3)
    
    return LazyVGrid(columns: Array(repeating: .init(.flexible()), count: columns), spacing: 30) {
        ForEach(0..<testCount) { index in
            VStack {
                Image(Testimage[index])
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .frame(width: 105, height: 105)
                    .clipShape(Circle())
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 115, height: 115)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(selectedCardIndex.wrappedValue == index ? Color.blue : Color.clear, lineWidth: 2.5)
                            )
                    )
                    .onTapGesture {
                        if selectedCardIndex.wrappedValue == index {
                            selectedCardIndex.wrappedValue = nil
                            selectedTestName = nil
                            
                        } else {
                            selectedCardIndex.wrappedValue = index
                            selectedTestName = Testname[index]
                            
                        }
                        print(selectedTestName)
                    }
                Text(Testname[index])
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
    }
    // Return the selected test name as a @Binding variable
    .onChange(of: selectedTestName) { newValue in
        selectedTestName = newValue
    }
}

func PVitalOrganTestcard(VitalOrganTestname: [String], VitalOrganTestimage: [String], viewAll: Bool, selectedCardIndex: Binding<Int?>) -> some View {
    let numItems = viewAll ? VitalOrganTestname.count : min(3, VitalOrganTestname.count)
    let numRows = (numItems + 2) / 3
    
    return LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 20) {
        ForEach(0..<numItems) { index in
            VStack {
                Image(VitalOrganTestimage[index])
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .frame(width: 105, height: 105)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 115, height: 115)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(selectedCardIndex.wrappedValue == index ? Color.blue : Color.clear, lineWidth: 3)
                            )
                    )
                    .onTapGesture {
                        if selectedCardIndex.wrappedValue == index {
                            selectedCardIndex.wrappedValue = nil
                            selectedTestName = nil
                        } else {
                            selectedCardIndex.wrappedValue = index
                            selectedTestName = VitalOrganTestname[index]
                        }
                        print(selectedTestName)
                    }
                Text(VitalOrganTestname[index])
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
    }
}


struct LabTestsScreen: View {
    @State var selectedRecommendedCardIndex: Int? = nil
    @State var selectedVitalOrganCardIndex: Int? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                PLabTestcard(Testname: ["Blood", "Diabetes", "Liver", "kidney"], Testimage: ["google", "apple", "facebook", "facebook"] , viewAll: false, selectedCardIndex: $selectedRecommendedCardIndex)
                
                PVitalOrganTestcard(VitalOrganTestname: ["Heart", "Lung", "Liver"], VitalOrganTestimage: ["apple", "google", "facebook"], viewAll: false, selectedCardIndex: $selectedVitalOrganCardIndex)
            }
            .padding(.horizontal)
        }
    }
}

struct LabTestsScreen_Previews: PreviewProvider {
    static var previews: some View {
        LabTestsScreen()
    }
}
