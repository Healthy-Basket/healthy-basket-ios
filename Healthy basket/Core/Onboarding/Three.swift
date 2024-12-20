//
//  Three.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 06/12/2024.
//

import SwiftUI

struct Three: View {
    @Binding var onboardingState: Onboarding
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("img2")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                
                VStack(spacing: 4) {
                    Text("Track your Nutrition")
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                
                Text("Know your food, reach your gooals")
                
                
                Spacer()
                
                Button {
                    onboardingState = .fourth
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 50)
                        .background(.orange)
                        .cornerRadius(10)
                }
                
                Image("step2")
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
                                onboardingState = .second
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    Three(onboardingState: .constant(.third))
}
