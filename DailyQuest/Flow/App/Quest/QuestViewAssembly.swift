//
//  QuestViewAssembly.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI

final class QuestViewAssembly {

    private let diContainer: DIContainer
    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator, diContainer: DIContainer) {
        self.coordinator = coordinator
        self.diContainer = diContainer
    }

    var view: some View {
        let viewModel = QuestView.QuestViewModel(coordinator: coordinator, diContainer: diContainer)
        let view = QuestView(viewModel: viewModel)

        return view
    }

}
