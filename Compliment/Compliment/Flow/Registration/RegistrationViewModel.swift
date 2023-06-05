//
//  RegistrationViewModel.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import Foundation
import Combine
import KeychainAccess

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var networkService: NetworkServiceProtocol
//    private var coordinator: any RegistrationCoordinating
    private var cancellable = Set<AnyCancellable>()

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
//        self.coordinator = coordinator
    }
    
    func registrate() {
        networkService
            .execute(RegistrationAPI.register(params: RegistrationRequestModel(username: self.username,
                                                                               email: self.email,
                                                                               password: self.password)),
                     model: RegistrationResponseModel.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let response):
                    self.saveSensitiveInfo(from: response)
//                    self.coordinator.route(to: <#T##RegistrationRoute#>)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellable)
    }
}

extension RegistrationViewModel {
    private func saveSensitiveInfo(from response: RegistrationResponseModel) {
        KeychainService.shared.save(response.access, key: .access)
        KeychainService.shared.save(response.refresh, key: .refresh)
    }
}
