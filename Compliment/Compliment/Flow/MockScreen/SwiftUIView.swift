//
//  SwiftUIView.swift
//  Compliment
//
//  Created by Мария Газизова on 24.05.2023.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel: MockScreenViewModel
//    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        Text("MOCK SCREEN")
        Button {
            // TODO: IMPORTANT !!!!!!!
            viewModel.coordinator.path.append(AppRoute.splashScreen)
//            coordinator.path.append(AppRoute.splashScreen)
        } label: {
            Text("Detail 1")
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
