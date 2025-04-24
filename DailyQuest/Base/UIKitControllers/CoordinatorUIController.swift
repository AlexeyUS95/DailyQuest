//
//  CoordinatorUIController.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import protocol SwiftUI.UIViewControllerRepresentable
import class UIKit.UIViewController

struct CoordinatorUIController<T>: UIViewControllerRepresentable where T: UIViewController {

    let coordinator: Coordinator<T>

    func makeUIViewController(context: Context) -> T {
        let viewController = T()
        context.coordinator.set(viewController: viewController)
        context.coordinator.start()

        return viewController
    }

    func updateUIViewController(_ uiViewController: T, context: Context) {}

    func makeCoordinator() -> Coordinator<T> {
        coordinator
    }
}
