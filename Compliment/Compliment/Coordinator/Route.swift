//
//  Route.swift
//  Compliment
//
//  Created by Мария Газизова on 19.05.2023.
//

import Foundation

enum NavigationTranisitionStyle {
    case push
}

protocol Route: Hashable {
    var transition: NavigationTranisitionStyle { get }
}

enum AppRoute: Route {
    case splashScreen
    
    var transition: NavigationTranisitionStyle {
        switch self {
        case .splashScreen:
            return .push
        }
    }
}

enum SplashScreenRoute: Route {
    case authorization
    case registration
    case mock
    
    var transition: NavigationTranisitionStyle {
        switch self {
        case .authorization, .registration, .mock:
            return .push
        }
    }
}

enum RegistrationRoute: Route {
    case fakeScreen
    
    var transition: NavigationTranisitionStyle {
        switch self {
        case .fakeScreen:
            return .push
        }
    }
}
