//
//  AccountServiceImpl.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

import Combine

final class AccountServiceImpl: AccountService {

//    private let appState: AppState
    private let userStorage: UserStorable

    var didUpdateAccount = PassthroughSubject<Account, Never>()

    var authToken: String? {
        switch userStorage.account {
        case .authorized(let token): return token
        case .unauthorized, .none: return nil
        }
    }

    init(userStorage: UserStorable) {
        self.userStorage = userStorage
    }

    func saveAuthCredentials(_ token: String) {
        let account: Account = .authorized(token: token)
        userStorage.account = account
        didUpdateAccount.send(account)
    }
}
