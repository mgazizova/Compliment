//
//  RegistrationViewModel.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func registrate() {
        self.networkService
            .execute(RegistrationAPI.register(params: RegistrationRequestModel(username: self.username,
                                                                               email: self.email,
                                                                               password: self.password)),
                     model: RegistrationResponseModel.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let response):
                    print("success, \(response)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellable)
    }
}
