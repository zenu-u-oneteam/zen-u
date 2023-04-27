//
//  ContentView.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI
import FirebaseAuth

func getUsetType() -> UserType {
    if let currentUserData = UserDefaults.standard.data(forKey: "currentUser") {
        let decoder = JSONDecoder()
        if let currentUser1 = try? decoder.decode(User.self, from: currentUserData) {
            print(currentUser1)
            return currentUser1.userType
        }
    }
    return .none
}

struct ContentView: View {
    @State private var isShowingSplash = true
    @State var userType: UserType = getUsetType()
    
    var body: some View {
        ZStack {
            if isShowingSplash {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isShowingSplash = false
                        }
                    }
            } else {
                NavigationStack {
                    if userType == .patient {
                        PMain()
                    } else {
                        OnBoardingScreen()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
