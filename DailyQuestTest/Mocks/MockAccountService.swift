//
//  MockAccountService.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

import Combine

final class MockAccountService: AccountService {

    var didUpdateAccount: PassthroughSubject<Account, Never> = PassthroughSubject<Account, Never>()

    var authToken: String?
    
    func saveAuthCredentials(_ token: String) {}
}
