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
        
        VStack(spacing: 20) {
            //loader
            if viewModel.isLoading {
                ProgressView("Loading...")
            }
            else{
                HStack(spacing: 10) {
                    Spacer()
                    Image(viewModel.user.profileImage)
                        .resizable()
                        .aspectRatio(1.5, contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(120)
                    Spacer()
                    VStack(alignment: .leading, spacing: 18) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(viewModel.user.name)
                                .font(.callout.bold())
                            VStack(alignment: .leading, spacing: 3) {
                                Text(String(viewModel.patient.age) + " years old")
                                Text(viewModel.patient.gender)
                            }
                        }
                        HStack() {
                            Text(viewModel.patient.bloodGroup)
                                .padding(.horizontal ,10)
                                .padding(.vertical ,8)
                                .background(.white)
                                .cornerRadius(30)
                            
                            Text(String("\(viewModel.patient.height) cm"))
                                .padding(.horizontal ,10)
                                .padding(.vertical ,8)
                                .background(.white)
                                .cornerRadius(20)
                            
                            Text(String("\(viewModel.patient.weight) kg"))
                                .padding(.horizontal ,10)
                                .padding(.vertical ,8)
                                .background(.white)
                                .cornerRadius(30)
                            Spacer()
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundColor(Color("Heading"))
                    Spacer()
                }
                .frame(height: 150)
                .padding(.vertical, 10)
                .background(Color("Secondary"))
                .cornerRadius(13)
                
                HStack(alignment: .center, spacing: 14) {
                    Spacer()
                    HStack(alignment: .center, spacing: 5) {
                        ZStack{
                            Rectangle()
                                .frame(width: 28, height: 28)
                                .foregroundColor(Color("Accent"))
                                .cornerRadius(28)
                            Image(systemName: "phone.fill")
                                .resizable()
                                .foregroundColor(Color("Primary"))
                                .padding(5)
                                .frame(width: 25, height: 25)
                        }
                        Text(viewModel.user.mobileNumber)
                            .font(.footnote)
                            .foregroundColor(Color("Heading"))
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
                                .foregroundColor(Color("Primary"))
                                .padding(5)
                                .frame(width: 25, height: 20)
                        }
                        Text(viewModel.user.email)
                            .font(.footnote)
                            .foregroundColor(Color("Heading"))
                            .padding(5)
                    }
                    Spacer()
                }
                .frame(height: 50)
                .padding(.vertical, 10)
                .background(Color("Secondary"))
                .cornerRadius(13)
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
