//
//  ForgotPassword.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 07/12/2024.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var passwordResetLinkSent: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 16) {
                Text("Enter your email")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(.top, 16)
                Text("You will receive a link to confirm the password change to the email address provided")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Email")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                inputField(imageName: "envelope", placeholder: "Email", type: $email)
                
                Spacer()
                
                AuthButton(buttonName: "Confirm", onClick: {
                    passwordResetLinkSent.toggle()
                })
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("onboardColor"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.left")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.orange)
                        .clipShape(Circle())
                        .onTapGesture {
                            dismiss()
                        }
                        
                }
            }
            .navigationDestination(isPresented: $passwordResetLinkSent) {
                ResetLinkSent()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    ForgotPassword()
}


extension ForgotPassword {
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
