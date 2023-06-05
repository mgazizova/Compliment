//
//  MockScreenVIewModel.swift
//  Compliment
//
//  Created by Мария Газизова on 26.05.2023.
//

import Foundation

class MockScreenViewModel: ObservableObject {
    @Published var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}
