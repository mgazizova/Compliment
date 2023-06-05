//
//  SplashView.swift
//  Compliment
//
//  Created by Мария Газизова on 22.05.2023.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            Text("This is Splash view")
                .navigationDestination(for: SplashScreenRoute.self) { route in
                    viewModel.coordinator.route(to: .registration)
                }
        }
    }
}
