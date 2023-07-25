//
//  RegistrationView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/28/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack{
            
            Image("picklelogo")
                .resizable()
                .scaledToFill()
                .frame(width:100, height: 100)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                
                Text("Register your account")
                    .font(.title2)
                    .foregroundColor(Color(.systemGray))
                
                InputView(text: $viewModel.email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $viewModel.username, title: "Username", placeholder: "Username")
                    .autocapitalization(.none)
                
                InputView(text: $viewModel.fullname, title: "Full Name", placeholder: "Your Name")
                
                InputView(text: $viewModel.password, title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm your password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    
                    if !viewModel.password.isEmpty && !confirmPassword.isEmpty {
                        if viewModel.password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                    
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                HStack {
                    Text("SIGN UP")
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
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in").fontWeight(.bold)
                        .font(.system(size: 14))
                }
            }
            
        }
    }
}

// MARK: - AuthenticationForm Protocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !viewModel.email.isEmpty
        && viewModel.email.contains("@")
        && !viewModel.password.isEmpty
        && viewModel.password.count > 5
        && confirmPassword == viewModel.password
        && !viewModel.fullname.isEmpty
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
