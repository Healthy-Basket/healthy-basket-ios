//
//  AuthButton.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 07/12/2024.
//

import SwiftUI

struct AuthButton: View {
    var buttonName: String
    var onClick: () -> ()
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                Text(buttonName)
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.orange)
            .cornerRadius(20)
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    AuthButton(buttonName: "Login", onClick: { })
}
