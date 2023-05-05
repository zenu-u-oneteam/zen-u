//
//  LoginPage.swift
//  Zen-u
//
//  Created by Prakhar Singh on 21/04/23.
//

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
    @EnvironmentObject var appState: AppState
    @State private var invalidCredentials = false
    @State private var email = ""
    @State private var password = ""
    @State var isLoggedIn = false
    @State var userType: UserType = .none
    
    let db = FirebaseConfig().db
    
    func passwordLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                invalidCredentials = true
            } else {
                let currentUserID = Auth.auth().currentUser?.uid
                if let currentUserID = currentUserID {
                    print(currentUserID)
                    db.collection("Users").document(currentUserID).getDocument {
                        (document, error) in
                        if let document = document, document.exists {
                            let dataDescription = document.data()!
                            let currentUser = User(
                                id: currentUserID,
                                name: dataDescription["name"] as! String,
                                email: dataDescription["email"] as! String,
                                userType: UserType(rawValue: dataDescription["userType"] as! String) ?? .admin,
                                profileImage: dataDescription["profileImage"] as! String,
                                mobileNumber: dataDescription["mobileNumber"] as! String
                            )
                            print(currentUser)
                            let encoder = JSONEncoder()
                            if let currentUserData = try? encoder.encode(currentUser) {
                                UserDefaults.standard.set(currentUserData, forKey: "currentUser")
                                print(currentUser.userType)
                                userType = currentUser.userType
                                appState.rootViewId = UUID()
                            }
                        } else {
                            print("Document does not exist")
                        }
                    }
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        TextField("Enter your email", text: $email)
                            .font(.system(size: 17, weight: .light))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .keyboardType(.emailAddress)
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
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
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
                    passwordLogin()
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
                
                VStack(spacing: 20) {
                    Button(action: {
                        // Perform Google sign-in action here
                        appState.rootViewId = UUID()
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
                        .frame(maxWidth: .infinity, minHeight: 50)
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
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }
                    Button(action: {
                        // Perform Facebook sign-in action here
                        //                        popToRootViewController(animated: false)
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
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }
                }
                .padding(.horizontal, 30)
            }.alert(isPresented: $invalidCredentials) {
                Alert(
                    title: Text("Invalid Credentials"),
                    message: Text("The email address or password you entered is incorrect.\n Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding(.top, 50)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarTitle("zen-u", displayMode: .inline)
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
