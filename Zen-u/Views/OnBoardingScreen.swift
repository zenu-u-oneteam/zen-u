//
//  OnBoardingScreen.swift
//  Zen-u
//
//  Created by Debarghya Barik on 18/04/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .trailing) {
                
                Image("ico")
                    .resizable()
                    .frame(width:510, height: 510)
                    .aspectRatio(contentMode: .fill)
                    .padding(.top, 50)
                
                VStack(alignment: .center){
                    Text("zen-u")
                        .fontWeight(.heavy)
                        .font(.system(size: 75).weight(.heavy))
                        .font(.largeTitle).foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Text("Transforming  Healthcare")
                        .font(.system(size:18.5))
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    HStack(spacing: 25){
                        
                        Button {
                            print("Login button")
                        } label: {
                            NavigationLink(destination: LoginPage()) {
                                ActionButton(text: "Log in")
                            }
                        }
                        .hTrailing()
                        
                        Button {
                            print("Sign Up button")
                        } label: {
                            NavigationLink(destination: SignupPage()) {
                                ActionButton(text: "Sign Up")
                            }
                        }
                        .hLeading()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        }
    }
}

extension View{
    func hCenter()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func hTrailing()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hLeading()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
