//
//  First.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 06/12/2024.
//

import SwiftUI

struct First: View {
    @Binding var onboardingState: Onboarding
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 4) {
                Image("logo")
                    .padding(.bottom, -30)
                Text("Welcome to")
                Text("Healthy Basket")
            }
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            
            Text("Your way to healty leaving")
                .font(.headline)
                .padding(.top, 12)
                .padding(.bottom, 46)
            
            
            Spacer()
            
            Button {
                onboardingState = .second
            } label: {
                HStack {
                    Text("Let's Start")
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.orange)
                .cornerRadius(20)
                .padding(.bottom, 32)
            }

        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("onboardColor"))
    }
}

#Preview {
    First(onboardingState: .constant(.first))
}
