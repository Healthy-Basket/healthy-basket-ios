//
//  Second.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 06/12/2024.
//

import SwiftUI

struct Second: View {
    @Binding var onboardingState: Onboarding
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                
                Image("img1")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
//                    .frame(width: 100, height: 100)
                
                VStack(spacing: 4) {
                    Text("Eat Smart,")
                    Text("Live Better")
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                
                Text("Healthy Choices made easy for you")
                
                
                Spacer()
                
                Button {
                    onboardingState = .third
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 50)
                        .background(.orange)
                        .cornerRadius(10)
                }
                
                Image("step1")
                    .padding()

            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("onboardColor"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Skip Intro")
                            .font(.subheadline)
                            .padding(4)
                            .padding(.horizontal)
                            .overlay(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                    }

                }
            }
        }
    }
}

#Preview {
    Second(onboardingState: .constant(.second))
}
