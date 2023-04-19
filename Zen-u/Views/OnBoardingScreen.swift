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
            
            Image("Group 64").resizable().aspectRatio(contentMode: .fit)
        
            VStack(alignment: .center){
                Text("zen-u")
                    .fontWeight(.heavy)
                    .font(.system(size: 75).weight(.heavy))
                    .font(.largeTitle).foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                
                Text("Transforming Healthcare").font(.system(size:18.5)).font(.title2).foregroundColor(.black)
                
                
                Spacer()
                
                HStack(alignment: .center){
                    Button {
                    }label: {
                        Text("  Log in   ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)


                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .background(Color.white, in: Circle())
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth:5))
                    
                    Button {
                    }label: {
                        Text(" Sign up ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .background(Color.white, in: Circle())
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth:5))
                        
                    }
                    
            
                }
            .hCenter()
            .padding(2)
        }
    }
}

extension View{
    func hCenter()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
