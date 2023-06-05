//
//  RegistrationView.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            TitleView(with: "Create account")
            // TODO: будет ли так работать?
            InputField(placeholder: "Username", text: $viewModel.username)
            InputField(placeholder: "Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            PasswordField(password: $viewModel.password)
            
            Button("Sign up") {
                viewModel.registrate()
            }
                .buttonStyle(.borderedProminent)
        }
    }
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView(viewModel: RegistrationViewModel())
//    }
//}
