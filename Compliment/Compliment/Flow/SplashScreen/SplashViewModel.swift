//
//  SplashViewModel.swift
//  Compliment
//
//  Created by Мария Газизова on 22.05.2023.
//

import Foundation
import Combine

class SplashViewModel: ObservableObject {
    @Published var coordinator: SplashScreenCoordinator
    
    private var networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol,
         coordinator: SplashScreenCoordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
        
        checkAccessToken()
    }
}

private extension SplashViewModel {
    func checkAccessToken() {
        let request = UserInfoAPI.getInfo
        
        guard let _ = request.headers else {
            coordinator.push(.authorization)
            // go to registrate/authorize
            return
        }
        
        networkService
            .execute(request,
                     model: InstanceModel.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(_):
                    self.coordinator.present(.mock)
                case .failure(let error):
                    self.refreshToken()
                    print("error", error.localizedDescription)
                }
            }.store(in: &cancellable)
    }
    
    func refreshToken() {
        let request = RefreshTokenAPI.refresh
        
        guard let _ = request.parameters else {
            // go to authorization
            return
        }
        
        networkService
            .execute(request,
                     model: RegistrationResponseModel.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(_):
                    print("skdlf")
//                    self.coordinator.route(to: .mock)
                case .failure(let error):
                    // go to authorization
                    print(error.localizedDescription)
                }
            }.store(in: &cancellable)
    }
 }
