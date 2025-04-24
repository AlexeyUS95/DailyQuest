//
//  AuthRootViewAssembly.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import SwiftUI

final class AuthRootViewAssembly {

    private let diContainer: DIContainer
    private let coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator, diContainer: DIContainer) {
        self.diContainer = diContainer
        self.coordinator = coordinator
    }

    var view: some View {
        let viewModel = AuthRootView.AuthRootViewModel(coordinator: coordinator, diContainer: diContainer)
        let view = AuthRootView(viewModel: viewModel)

        return view
    }
}
