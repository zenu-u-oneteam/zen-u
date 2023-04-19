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
        
            Image("Group 64").resizable().aspectRatio(contentMode: .fit).padding(.top, 42.0)
        
            VStack(alignment: .center){
                Text("zen-u")
                    .fontWeight(.heavy)
                    .font(.system(size: 75).weight(.heavy))
                    .font(.largeTitle).foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                
                Text("Transforming Healthcare").font(.system(size:16)).font(.title2).foregroundColor(.black)
                
                Spacer()
                
                HStack(spacing: 25){
                    Button {
                    }label: {
                        Text("  Log in   ")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)


                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .frame(width: 35, height: 25)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .background(Color.white, in: Circle())
                    }.frame(width: 120, height: 20)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
                    .hTrailing()
                    
                    
                    
                    Button {
                    }label: {
                        Text(" Sign up ")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .frame(width: 35, height: 25)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .background(Color.white, in: Circle())
                    }.frame(width: 120, height: 20)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
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
