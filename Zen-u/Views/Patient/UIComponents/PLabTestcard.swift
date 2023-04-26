import SwiftUI

func PLabTestcard(Testname:[String], Testimage: [String] , showNumber : Int) -> some View {
    //    var showNumber : Int
    VStack {
        HStack(spacing: 20) {
            ForEach(0...showNumber, id: \.self) { index in
                VStack {
                    Image(Testimage[index])
                        .resizable().frame(width: 60, height: 60).clipShape(Circle())
                        .frame(width: 105, height: 105)
                        .clipShape(Circle())
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)).frame(width: 105, height: 105))
                    
                    Text(Testname[index])
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

func PVitalOrganTestcard(VitalOrganTestname:[String], VitalOrganTestimage: [String]) -> some View {
    HStack(spacing: 20) {
        ForEach(VitalOrganTestname.indices, id: \.self) { index in
            VStack {
                Image(VitalOrganTestimage[index])
                    .resizable().frame(width: 60, height: 60).clipShape(Circle())
                    .frame(width: 105, height: 105)
                    .clipShape(Circle())
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)).frame(width: 105, height: 105))
                Text(VitalOrganTestname[index])
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct LabTestsScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                PLabTestcard(Testname: ["Blood", "Diabetes", "Liver"], Testimage: ["google", "apple", "facebook"] , showNumber: 2)
                
                PVitalOrganTestcard(VitalOrganTestname: ["Heart", "Lung", "Liver"], VitalOrganTestimage: ["apple", "google", "facebook"])
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
