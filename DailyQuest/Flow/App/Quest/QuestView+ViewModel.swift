//
//  QuestViewModel.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI
import Combine

extension QuestView {

    final class QuestViewModel: ObservableObject {

        private let diContainer: DIContainer
        private let coordinator: AppCoordinator

        init(coordinator: AppCoordinator, diContainer: DIContainer) {
            self.coordinator = coordinator
            self.diContainer = diContainer
        }
    }
}
