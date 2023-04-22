//
//  LoginPage.swift
//  Zen-u
//
//  Created by Prakhar Singh on 21/04/23.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            VStack {
                
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
                .padding(.horizontal, 30)
                .padding(.vertical)
                
                HStack(alignment: .center, spacing: 13) {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    SecureField("Enter your password", text: $password)
                        .font(.system(size: 17, weight: .light))
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
                
                .padding(.horizontal, 30)
                
                HStack {
                    Spacer()
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 30)
                
                Button {
                    // Perform login action here
                } label: {
                    ActionButton(text: "Log in")
                }
                .padding(.top, 20)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(
                        destination: SignupPage(),
                        label: {
                            Text("Sign Up.")
                                .foregroundColor(.blue)
                                .fontWeight(.semibold)
                        })
                }
                .padding()
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                        .padding(.trailing, 15)
                    Text("OR")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .font(.system(size: 20))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                        .padding(.leading, 15)
                }
                .padding(.vertical)
                .padding(.bottom)
                
                //                    Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {
                        // Perform Google sign-in action here
                    }) {
                        HStack {
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Sign in with Google")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .padding(.horizontal, 51)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }
                    Button(action: {
                        // Perform Apple sign-in action here
                    }) {
                        HStack {
                            Image("apple")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Sign in with Apple")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .padding(.horizontal, 56)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }
                    Button(action: {
                        // Perform Facebook sign-in action here
                    }) {
                        HStack {
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Sign in with Facebook")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .padding(.horizontal, 40)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }
                }
                .padding(.horizontal, 30)
                
            }
            .navigationBarTitle("zen-u", displayMode: .inline)
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
