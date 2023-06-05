//
//  Coordinator.swift
//  Compliment
//
//  Created by Мария Газизова on 19.05.2023.
//

import SwiftUI

protocol Coordinator : AnyObject {
    associatedtype RouteType: Route
    associatedtype T: View
    
    var path: NavigationPath { get set }
    
    func push(_ route: RouteType)
    func pop()
    func popToRoute()
    
    func route(to route: RouteType) -> T
}

extension Coordinator {
    func present(_ route: RouteType) {
        popToRoute()
        path.append(route)
    }
    
    func push(_ route: RouteType) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoute() {
        path.removeLast(path.count)
    }
}
