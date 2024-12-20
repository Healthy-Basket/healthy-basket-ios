//
//  Four.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 06/12/2024.
//

import SwiftUI

struct Four: View {
    @Binding var onboardingState: Onboarding
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Your Personalized")
                    Text("AI Coach")
                }
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                
                Text("Guidance tailored just for you")
                
                
                Spacer()
                
                NavigationLink {
                    LoginView()
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 50)
                        .background(.orange)
                        .cornerRadius(10)
                }

                Image("step3")
                    .padding()

            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("onboardColor"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.orange)
                        .clipShape(Circle())
                        .onTapGesture {
                            withAnimation(.smooth) {
                                onboardingState = .third
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    Four(onboardingState: .constant(.fourth))
}
