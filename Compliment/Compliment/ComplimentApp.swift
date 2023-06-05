//
//  ComplimentApp.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import SwiftUI

@main
struct ComplimentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let coordinator = AppCoordinator()
            coordinator.route(to: .splashScreen)
        }
    }
}
