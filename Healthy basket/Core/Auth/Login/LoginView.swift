//
//  LoginView.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 07/12/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    Text("Welcome Back")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 30) {
                        Image("google")
                        Image("apple")
                    }
                }
                .padding(.top, 16)
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 2)
                    
                    Text("Or")
                        .foregroundStyle(.white)
                    
                    Rectangle()
                        .fill(.white)
                        .frame(height: 2)
                }
                
                Text("Email")
                    .foregroundStyle(.gray)
                inputField(imageName: "envelope", placeholder: "Email", type: $email)
                Text("Password")
                    .foregroundStyle(.gray)
                inputField(imageName: "lock", placeholder: "Password", type: $password, showPassword: $showPassword)
                
                NavigationLink {
                    ForgotPassword()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Forgot Password?")
                        .foregroundStyle(.gray)
                        .underline()
                }

                
                HStack {
                    Text("Don't have an account yet?")
                        .foregroundStyle(.gray)
                    
                    NavigationLink {
                        Signup()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Sign up")
                            .foregroundStyle(.blue)
                            .underline()
                    }
                  
                }
                
                
                Spacer()
                
                AuthButton(buttonName: "Login", onClick: {
                    
                })

            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("onboardColor"))
        }
    }
}

#Preview {
    LoginView()
}


extension LoginView {
    private func inputField(
        imageName: String,
        placeholder: String,
        type: Binding<String>,
        showPassword: Binding<Bool>? = nil
    ) -> some View {
        VStack {
            HStack {
                Image(systemName: "envelope")
                if let showPassword = showPassword {
                    TextField(placeholder, text: type)
                } else {
                    SecureField(placeholder, text: type)
                }
                
                if let showPassword = showPassword {
                    Image(systemName: showPassword.wrappedValue ? "eye.slash" : "eye")
                        .onTapGesture {
                            withAnimation(.smooth) {
                                showPassword.wrappedValue.toggle()
                            }
                        }
                }
            }
            .foregroundStyle(.gray)
            .padding()
            .background(.white)
            .cornerRadius(10)
        }
    }
}
