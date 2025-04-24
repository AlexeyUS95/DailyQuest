//
//  AuthCoordinator.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import SwiftUI

protocol AuthCoordinator: Coordinator<UINavigationController> {

}

final class AuthCoordinatorImpl: Coordinator<UINavigationController>, NavigationFlow, AuthCoordinator {

    private let diContainer: DIContainer

    var navigationController: UINavigationController? {
        return viewController
    }

    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }

    override func start() {
        let view = AuthRootViewAssembly(coordinator: self, diContainer: diContainer).view
        pushAsRoot(view)
    }

}
