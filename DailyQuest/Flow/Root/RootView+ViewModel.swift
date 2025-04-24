import SwiftUI
import Combine

extension RootView {

    final class RootViewModel: ObservableObject {

        @Published private(set) var state: State = .notAuthorized

        private let cancelBag: CancelBag = CancelBag()
        private let diContainer: DIContainer
        private var coordinator: Coordinatable?

        var authCoordinator: AuthCoordinator {
            guard let currentAuthCoordinator = coordinator as? AuthCoordinator else {
                let navigation = UINavigationController()
                let coordinator = AuthCoordinatorImpl(diContainer: diContainer)
                coordinator.set(viewController: navigation)
                self.coordinator = coordinator

                return coordinator
            }

            return currentAuthCoordinator
        }

        var appCoordinator: AppCoordinator {
            guard let currentAppCoordinator = coordinator as? AppCoordinator else {
                let navigation = UINavigationController()
                let coordinator = AppCoordinatorImpl(diContainer: diContainer)
                coordinator.set(viewController: navigation)
                self.coordinator = coordinator
                
                return coordinator
            }

            return currentAppCoordinator
        }

        init(diContainer: DIContainer) {
            self.diContainer = diContainer
            setupFlow()
            setupBinding()
        }

        private func setupFlow() {
            switch diContainer.storage.account {
            case .authorized(token: ""):
                state = .authorized

            case .unauthorized:
                state = .notAuthorized

            default:
                state = .notAuthorized
            }
        }

        private func setupBinding() {
            diContainer.services.accountService.didUpdateAccount
                .receive(on: DispatchQueue.main)
                .sink { [weak self] account in
                    switch account {
                    case .authorized: self?.state = .authorized
                    case .unauthorized: self?.state = .notAuthorized
                    }
                }
                .store(in: cancelBag)
        }
    }
}

extension RootView.RootViewModel {

    enum State {

        case notAuthorized
        case authorized
    }
}
