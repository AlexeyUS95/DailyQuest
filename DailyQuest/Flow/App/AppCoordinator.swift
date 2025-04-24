//
//  AppCoordinator.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI

protocol AppCoordinator: Coordinator<UINavigationController> {

}

final class AppCoordinatorImpl: Coordinator<UINavigationController>, NavigationFlow, AppCoordinator {

    private let diContainer: DIContainer

    var navigationController: UINavigationController? {
        return viewController
    }

    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }

    override func start() {
        let view = QuestViewAssembly(coordinator: self, diContainer: diContainer).view
        pushAsRoot(view)
    }
}
