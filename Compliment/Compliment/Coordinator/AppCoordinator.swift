//
//  AppCoordinator.swift
//  Compliment
//
//  Created by Мария Газизова on 19.05.2023.
//

import SwiftUI

protocol AppCoordinating: Coordinator {}

extension AppCoordinating {
    func route(to route: AppRoute) -> some View {
        switch route {
        case .splashScreen:
            let networkService = NetworkService.shared
            let coordinator = SplashScreenCoordinator()
            let viewModel = SplashViewModel(networkService: networkService,
                                            coordinator: coordinator)
            return SplashView(viewModel: viewModel)
        }
    }
}

class AppCoordinator: AppCoordinating, ObservableObject {
    @Published var path = NavigationPath()
}
