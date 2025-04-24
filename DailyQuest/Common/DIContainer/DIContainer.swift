/// Dependency injection container
protocol DIContainer {

    /// Common app services
    var services: DIServices.Services { get }

    /// Services for managing Network requests
    var networkServices: DIServices.NetworkServices { get }

    /// Cross-app storage
    var storage: UserStorable { get }
}

enum DIServices {

    /// Common app services
    final class Services {

        /// User authorization service
        let accountService: AccountService

        init(
            accountService: AccountService
        ) {
            self.accountService = accountService
        }
    }

    /// User authorization managing network service
    final class NetworkServices {

        let authService: AuthService

        init(
            authService: AuthService
        ) {
            self.authService = authService
        }
    }
}
