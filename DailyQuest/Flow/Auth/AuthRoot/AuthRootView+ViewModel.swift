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

        private let coordinator: AuthCoordinator
        private let diContainer: DIContainer

        init(coordinator: AuthCoordinator, diContainer: DIContainer) {
            self.coordinator = coordinator
            self.diContainer = diContainer
        }

        func login() {
            let token = "12345"
            diContainer.services.accountService.saveAuthCredentials(token)
        }
    }
}
