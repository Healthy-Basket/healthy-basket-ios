//
//  RootView.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 09/12/2024.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isOnBoardingComplete") var isOnBoardingComplete: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isOnBoardingComplete {
                    LoginView()
                } else {
                    Onboard()
                }
            }
        }
    }
}

#Preview {
    RootView()
}
