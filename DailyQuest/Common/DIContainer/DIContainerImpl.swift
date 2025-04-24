//
//  DailyQuestApp.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 20.04.2025.
//

final class DIContainerImpl: DIContainer {

    var storage: UserStorable
    let services: DIServices.Services
    let networkServices: DIServices.NetworkServices

    init(
        services: DIServices.Services,
        networkServices: DIServices.NetworkServices,
        storage: UserStorable
    ) {
        self.services = services
        self.networkServices = networkServices
        self.storage = storage
    }
}
