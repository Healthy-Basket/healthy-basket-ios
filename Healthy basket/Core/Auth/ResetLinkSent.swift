//
//  ResetLinkSent.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 07/12/2024.
//

import SwiftUI

struct ResetLinkSent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("illo")
                    .padding(.top, 32)
                
                Text("Check your inbox for the password reset link")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)

                Spacer()
                
                AuthButton(buttonName: "Login", onClick: {
                    dismiss()
                    dismiss()
                })
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("onboardColor"))
        }
    }
}

#Preview {
    ResetLinkSent()
}
