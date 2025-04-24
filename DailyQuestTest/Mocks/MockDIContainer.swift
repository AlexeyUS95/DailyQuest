//
//  DailyQuestApp.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 20.04.2025.
//

final class MockDIContainer: DIContainer {

    var services: DIServices.Services
    var networkServices: DIServices.NetworkServices
    var storage: any UserStorable

    init() {
        storage = MockStorage()
        services = DIServices.Services(
            accountService: MockAccountService()
        )
        networkServices = DIServices.NetworkServices(
            authService: MockAuthService()
        )
    }
}

extension DIContainer where Self == MockDIContainer {
    static var preview: DIContainer {
        return MockDIContainer()
    }
}
