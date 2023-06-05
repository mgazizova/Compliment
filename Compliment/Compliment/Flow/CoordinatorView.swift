//
//  CoordinatorView.swift
//  Compliment
//
//  Created by Мария Газизова on 25.05.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SwiftUIView(viewModel: MockScreenViewModel(coordinator: coordinator))
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splashScreen:
                        coordinator.route(to: .splashScreen)
                    }
                }
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
