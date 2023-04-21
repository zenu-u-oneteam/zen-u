//
//  SignupPage.swift
//  Zen-u
//
//  Created by Prakhar Singh on 20/04/23.
//

import SwiftUI

struct SignupPage: View {

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var agreedToTerms = false

    var body: some View {
        NavigationView {
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
                        TextField("Enter your name", text: $name)
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
                        TextField("Enter your email", text: $email)
                            .font(.system(size: 17, weight: .light))
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
                }
                
                
                HStack(alignment: .center, spacing: 13) {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    SecureField("Enter your password", text: $password)
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
                

                Button {
                    // Perform signup action here
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
                    .background(agreedToTerms ? Color(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0) : Color.gray)
                    .cornerRadius(60)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
                }
                .disabled(!agreedToTerms)
                
//                                Spacer()  //remove for bringing everything down
                
            }
            .padding()
            .navigationBarTitle("zen-u", displayMode: .inline)
        }
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
