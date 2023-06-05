//
//  SplashScreenCoordinator.swift
//  Compliment
//
//  Created by Мария Газизова on 22.05.2023.
//

import SwiftUI

class SplashScreenCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func route(to route: SplashScreenRoute) -> some View {
        switch route {
        case .authorization:
            let networkService = NetworkService.shared
            let viewModel = AuthorizationViewModel(networkService: networkService)
            let view = AuthorizationView(viewModel: viewModel)
            
            return AnyView(view)
        case .registration:
            let networkService = NetworkService.shared
            let viewModel = RegistrationViewModel(networkService: networkService)
            let view = RegistrationView(viewModel: viewModel)

            return AnyView(view)
        case .mock:
            return AnyView(SwiftUIView(viewModel: MockScreenViewModel(coordinator: AppCoordinator())))
        }
    }
}
