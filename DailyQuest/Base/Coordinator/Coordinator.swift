//
//  Coordinator.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import SwiftUI

protocol Coordinatable: AnyObject {

    var controller: UIViewController? { get }
}

class Coordinator<T>: Coordinatable where T: UIViewController {

    private(set) weak var viewController: T?

    var controller: UIViewController? {
        return viewController
    }

    func set(viewController: T?) {
        self.viewController = viewController
    }

    func start() {
        fatalError("Root Coordinator - don't have start")
    }
}
