//
//  AuthRootView+ViewModel.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI
import Combine

extension AuthRootView {

    final class AuthRootViewModel: ObservableObject {

        @Published var email: String = ""
        @Published var password: String = ""

        private let coordinator: AuthCoordinator
        private let diContainer: DIContainer

        init(coordinator: AuthCoordinator, diContainer: DIContainer) {
            self.coordinator = coordinator
            self.diContainer = diContainer
        }

        func login(email: String, password: String) {
            let token = "12345"
            diContainer.services.accountService.saveAuthCredentials(token)
        }
    }
}
