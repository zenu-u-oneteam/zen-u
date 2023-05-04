//
//  SignupPage.swift
//  Zen-u
//
//  Created by Prakhar Singh on 20/04/23.
//

import SwiftUI

struct SignupPage: View {
    
    @StateObject private var viewModel = ViewModel()
    @State private var agreedToTerms = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image("signupImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 280)
                .padding(.bottom, -60)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                    TextField("Enter your name", text: $viewModel.user.name)
                        .font(.system(size: 17, weight: .light))
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter your email", text: $viewModel.user.email)
                        .font(.system(size: 17, weight: .light))
                        .textInputAutocapitalization(.never)
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
            }
        
            
            HStack(alignment: .center, spacing: 13) {
                Image(systemName: "lock")
                    .foregroundColor(.black)
                SecureField("Enter your password", text: $viewModel.password)
                    .font(.system(size: 17, weight: .light))
                Spacer()
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(12)
            
            VStack(alignment: .leading) {
                HStack {
                    CheckBoxView(checked: $agreedToTerms)
                        .cornerRadius(5)
                    Text("I agree to the zen-u Terms of Service and Privacy Policy")
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            
            Button(action: {
                viewModel.addingUser()
            }, label: {
                    ActionButton(text: "Sign Up", disabled: !agreedToTerms)
            }).disabled(!agreedToTerms)
            
            Spacer()  //remove for bringing everything down
            
        }
        .padding()
        .navigationBarTitle("zen-u", displayMode: .inline)
        .navigationDestination(isPresented: $viewModel.canContinue, destination: {
            POnboarding()
        })
    }
}

struct CheckBoxView: View {
    
    @Binding var checked: Bool
    
    var body: some View {
        Button(action: {
            self.checked.toggle()
        }) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? .black: .gray)
        }
    }
}




struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}
