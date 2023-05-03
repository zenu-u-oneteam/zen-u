//
//  Profile Header View.swift
//  Zen-u
//
//  Created by Aindrila Ray on 21/04/23.
//

import SwiftUI


struct ProfileHeaderView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                else{
                    
                    HStack(spacing: 16) {
                        Image(viewModel.user.profileImage)
                            .resizable()
                            .aspectRatio(1.5, contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .cornerRadius(120)
                        VStack(alignment: .leading, spacing: 18) {
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text(viewModel.user.name)
                                    .font(.callout.bold())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(String(viewModel.patient.age) + " years old")
                                    Text(viewModel.patient.gender)
                                    
                                }
                            }
                            
                            HStack(spacing: 1) {
                                Text(viewModel.patient.bloodGroup)
                                    .padding(10)
                                    .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(30)
                                
                                Text(String("\(viewModel.patient.height) cm"))
                                    .padding(10)
                                    .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(20)
                                
                                Text(String("\(viewModel.patient.weight) kg"))
                                    .padding(10)
                                    .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(30)
                            }
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        
                    }
                    .padding(18)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(15)
                    .padding(10)
                    
                    HStack(alignment: .center, spacing: 14) {
                        
                        HStack(alignment: .center, spacing: 5) {
                            
                            ZStack{
                                
                                Rectangle()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(Color("Accent"))
                                    .cornerRadius(28)
                                Image(systemName: "phone.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                                    .padding(5)
                                    .frame(width: 25, height: 25)
                            }
                            
                            Text(viewModel.user.mobileNumber)
                                .font(.footnote)
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                .padding(5)
                        }
                        
                        HStack(alignment: .center, spacing: 5) {
                            
                            ZStack {
                                
                                Rectangle()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(Color("Accent"))
                                    .cornerRadius(28)
                                Image(systemName: "envelope.fill")
                                    .resizable()
                                    .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                                    .padding(5)
                                    .frame(width: 25, height: 20)
                                
                            }
                            
                            Text(viewModel.user.email)
                                .font(.footnote)
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                .padding(5)
                        }
                        
                    }
                    .padding(18)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(15)
                    .padding(10)
                    .navigationTitle("Profile")
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
