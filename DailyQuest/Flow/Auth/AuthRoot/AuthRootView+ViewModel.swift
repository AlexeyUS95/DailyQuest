//
//  AuthRootView+ViewModel.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import SwiftUI
import Combine

extension AuthRootView {

    final class AuthRootViewModel: ObservableObject {

        @Published var email: String = ""
        @Published var emailErrorMessage: String?

        @Published var password: String = ""
        @Published var passwordErrorMessage: String?

        private let coordinator: AuthCoordinator
        private let diContainer: DIContainer
        private let cancelBag: CancelBag = CancelBag()


        init(coordinator: AuthCoordinator, diContainer: DIContainer) {
            self.coordinator = coordinator
            self.diContainer = diContainer
            setupBinding()
        }

        func login(email: String, password: String) {
            let token = "12345"
            diContainer.services.accountService.saveAuthCredentials(token)
        }

        private func setupBinding() {
            $email
                .drop(while: { $0.isEmpty } )
                .removeDuplicates()
                .map { [weak self] in self?.validateEmail(email: $0) }
                .assignWeak(to: \.emailErrorMessage, on: self)
                .store(in: cancelBag)
        }

        private func validateEmail(email: String) -> String? {
            if case let .error(error) = diContainer.services.validationService.validate(value: email, rules: [.correctEmail, .notEmpty]) {
                switch error {
                case .empty:
                    return "empty email"
                case .notValid:
                    return "not valid email"
                default:
                    return nil
                }
            } else {
                return nil
            }
        }
    }
}
