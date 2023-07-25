//
//  LoginView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/28/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                // image
                
                Image("picklelogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height: 100)
                    .padding(.vertical, 32)
                
                //form fields
                VStack(spacing: 24) {
                    InputView(text: $viewModel.email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                        .font(.subheadline)
                    
                    InputView(text: $viewModel.password, title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                // TODO: Add a forgot password button
                
                Button {
                    Task{
                        Task { try await viewModel.signIn()}
                    }
                    
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }.foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 256, height: 48)
                }.background(Color("StockGreen"))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(10)
                    .padding(.top, 24)

                Spacer()
                
                // sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up").fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                }

                
            }
        }
    }
}

// MARK: - AuthenticationForm Protocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !viewModel.email.isEmpty
        && viewModel.email.contains("@")
        && !viewModel.password.isEmpty
        && viewModel.password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
