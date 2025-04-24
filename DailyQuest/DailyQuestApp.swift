//
//  DailyQuestApp.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 20.04.2025.
//

import SwiftUI

@main
struct DailyQuestApp: App {

    private let diContainer: DIContainer

    private var rootViewModel: RootView.RootViewModel {
        return RootView.RootViewModel(
            diContainer: diContainer
        )
    }

    init() {
        let storage = AppStorage.shared.userStorage

        let services = DIServices.Services(
            accountService: AccountServiceImpl(userStorage: storage)
        )

        let networkServices = DIServices.NetworkServices(
            authService: AuthServiceImpl()
        )

        self.diContainer = DIContainerImpl(
            services: services,
            networkServices: networkServices,
            storage: storage
        )
    }

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: rootViewModel)
        }
    }
}
