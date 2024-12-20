//
//  Onboard.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 06/12/2024.
//

import SwiftUI


enum Onboarding {
    case first
    case second
    case third
    case fourth
}

struct Onboard: View {
    @State var onboardingState: Onboarding = .first
    
    var body: some View {
        NavigationStack {
            ZStack {
                if onboardingState == .first {
                    First(onboardingState: $onboardingState)
                    
                } else if onboardingState == .second {
                    Second(onboardingState: $onboardingState)
                    
                } else if onboardingState == .third {
                    Three(onboardingState: $onboardingState)
                    
                } else {
                    Four(onboardingState: $onboardingState)
                        .onAppear {
                            // set the isloading to off 
                        }
                }
            }
        }
    }
}

#Preview {
    Onboard()
}
