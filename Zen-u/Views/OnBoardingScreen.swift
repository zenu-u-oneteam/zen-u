//
//  OnBoardingScreen.swift
//  Zen-u
//
//  Created by Debarghya Barik on 18/04/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    var body: some View {
        
        ZStack(alignment: .trailing){
        
            Image("Group 64")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 42.0)
        
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
                        HStack(alignment: .center, spacing: 13){
                        
                            Text("Log in")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                            
                            
                            Image(systemName: "arrow.right")
                                .font(.callout)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .background(Color.white, in: Circle())
                        }
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .cornerRadius(60)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
                    }
                    .hTrailing()
                    
                    Button {
                        print("Sign Up button")
                    } label: {
                        HStack(alignment: .center, spacing: 12){
                            Text("Sign Up")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 15)
                            
                            
                            Image(systemName: "arrow.right")
                                .font(.callout)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .background(Color.white, in: Circle())
                        }
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .cornerRadius(60)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
                    }
                    .hLeading()
                }
            }
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
