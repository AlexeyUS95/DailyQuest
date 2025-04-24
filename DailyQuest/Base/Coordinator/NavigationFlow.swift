//
//  NavigationFlow.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import SwiftUI

protocol NavigationFlow: AnyObject {

    var navigationController: UINavigationController? { get }
}

extension NavigationFlow {

    func push<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = UIHostingController(rootView: view)
        controller.hidesBottomBarWhenPushed = !(navigationController?.viewControllers.isEmpty ?? true)

        navigationController?.pushViewController(controller, animated: animated)
    }

    func pushAsRoot<Content: View>(_ view: Content, animated: Bool = true) {
        push(view, animated: animated)

        if let topController = navigationController?.topViewController {
            navigationController?.viewControllers = [topController]
        }
    }
}
