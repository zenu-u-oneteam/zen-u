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
        ScrollView(showsIndicators: false) {
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
                        TextField("Enter your name", text: $viewModel.userName)
                            .font(.system(size: 17, weight: .light))
                            .autocorrectionDisabled(true)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        TextField("Enter your email", text: $viewModel.email)
                            .font(.system(size: 17, weight: .light))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .keyboardType(.emailAddress)
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
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
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
                
                
                Button {
                    viewModel.addingUser()
                } label: {
                    ActionButton(text: "Sign Up", disabled: (!agreedToTerms || viewModel.userName.isEmpty || viewModel.password.isEmpty || viewModel.email.isEmpty))
                }
                .disabled(!agreedToTerms || viewModel.userName.isEmpty || viewModel.password.isEmpty || viewModel.email.isEmpty)
                
                Spacer()  //remove for bringing everything down
                
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarTitle("zen-u", displayMode: .inline)
        .padding()
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationDestination(isPresented: $viewModel.canContinue, destination: {
            POnboarding(userName: viewModel.userName, email: viewModel.email)
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
