//
//  Signup.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 07/12/2024.
//

import SwiftUI

enum PasswordCriteria: String {
    case length = "At least 8 characters"
    case uppercase = "At least 1 uppercase letter"
    case lowercase = "At least 1 lowercase letter"
    case number = "At least 1 number"
    case special = "At least 1 special character"
}

struct PasswordCheckView: View {
    let criteria: PasswordCriteria
    let isValid: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isValid ? "checkmark.circle.fill" : "x.circle.fill")
                .foregroundColor(isValid ? .green : .red)
            Text(criteria.rawValue)
                .font(.caption)
            Spacer()
        }
    }
}

struct Signup: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var privacyPolicyChecked: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack {
                    Text("Create an Account")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 30) {
                        Image("google")
                        Image("apple")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 12)
                
                Text("Full Name")
                inputField(imageName: "person", placeholder: "Full Name", type: $fullName)
                Text("Email")
                inputField(imageName: "envelope", placeholder: "Email", type: $email)
                Text("Passoword")
                inputField(imageName: "lock", placeholder: "Password", type: $password, showPassword: $showPassword)
                Text("Confirm Password")
                inputField(imageName: "lock", placeholder: "Confirm Password", type: $confirmPassword, showPassword: $showPassword)
                
                
                VStack {
                    HStack {
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    PasswordCheckView(criteria: .length,
                                      isValid: hasMinLength(password))
                    PasswordCheckView(criteria: .uppercase,
                                      isValid: hasUppercase(password))
                    PasswordCheckView(criteria: .lowercase,
                                      isValid: hasLowercase(password))
                    PasswordCheckView(criteria: .number,
                                      isValid: hasNumber(password))
                    PasswordCheckView(criteria: .special,
                                      isValid: hasSpecialCharacter(password))
                }
                .padding(.vertical, 4)
                
                // need link to privacy policy and terms of use
                HStack(alignment: .top) {
                    Image(systemName: "square")
                        .overlay {
                            if privacyPolicyChecked {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.blue)
                            }
                        }
                        .onTapGesture {
                            privacyPolicyChecked.toggle()
                        }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("By continuing you accept our Privacy Policy")
                        Text(" and Terms of Use")
                    }
                }
                .font(.subheadline)
                
                Spacer()
                
                AuthButton(buttonName: "Sign up", onClick: {
                    
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
        }
    }
}

#Preview {
    Signup()
}


extension Signup {
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
            .padding(14)
            .background(.white)
            .cornerRadius(12)
        }
    }
}


// Add these validation functions in your Signup extension
extension Signup {
    func isPasswordValid(_ password: String) -> Bool {
        return hasMinLength(password) &&
        hasUppercase(password) &&
        hasLowercase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password)
    }
    
    func hasMinLength(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    func hasUppercase(_ password: String) -> Bool {
        return password.contains(where: { $0.isUppercase })
    }
    
    func hasLowercase(_ password: String) -> Bool {
        return password.contains(where: { $0.isLowercase })
    }
    
    func hasNumber(_ password: String) -> Bool {
        return password.contains(where: { $0.isNumber })
    }
    
    func hasSpecialCharacter(_ password: String) -> Bool {
        let specialCharacters = "!@#$%^&*(),.?\":{}|<>"
        return password.contains(where: { specialCharacters.contains($0) })
    }
}
