//
//  RegistrationCoordinator.swift
//  Compliment
//
//  Created by Мария Газизова on 22.05.2023.
//

import SwiftUI

class RegistrationCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func route(to route: RegistrationRoute) -> some View {
        switch route {
        case .fakeScreen:
            let networkService = NetworkService.shared
            let viewModel = RegistrationViewModel(networkService: networkService)
            let view = RegistrationView(viewModel: viewModel)
        }
    }
}
