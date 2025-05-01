//
//  AuthRootView.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI

struct AuthRootView: View {

    @StateObject var viewModel: AuthRootViewModel

    var body: some View {
        ZStack {
            Color.Colors.screenBackground
                .ignoresSafeArea()

            VStack(spacing: 16) {

                logo
                Spacer()

                email
                password
                forgotPassword

                Spacer()
                signIn
            }
        }
    }

    @ViewBuilder private var logo: some View {
        Text("LOGO")
            .font(UIFont.header.font())
            .padding(.top, 50)
    }

    @ViewBuilder private var email: some View {
        CustomTextField(text: $viewModel.email, placeholder: "Email")
            .padding(.horizontal, 16)
    }

    @ViewBuilder private var password: some View {
        CustomTextField(text: $viewModel.password, placeholder: "Password")
            .padding(.horizontal, 16)
    }

    @ViewBuilder private var forgotPassword: some View {
        HStack {
            Spacer()

            Button {

            } label: {
                Text("Forgot password?")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.Colors.placeholder)
            }
            .padding(.horizontal, 16)
        }
    }

    @ViewBuilder private var signIn: some View {
        Button("Sign in") {

        }
        .font(.headline)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(.blue)
        .cornerRadius(24)
        .padding(16)
    }
}

#Preview {
    AuthRootView(
        viewModel: AuthRootView.AuthRootViewModel(
            coordinator: AuthCoordinatorImpl(diContainer: .preview),
            diContainer: .preview
        )
    )
}
