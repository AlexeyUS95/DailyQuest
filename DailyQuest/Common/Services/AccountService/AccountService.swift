//
//  AccountService.swift
//  DailyQuest
//
//  Created by mac on 24.04.2025.
//

import Combine

/// User authorization service
protocol AccountService {

    /// Broadcast event when user's data is updated
    var didUpdateAccount: PassthroughSubject<Account, Never> { get }

    /// Current user authorization token
    var authToken: String? { get }

    /// Save authorization token to Storage
    func saveAuthCredentials(_ token: String)
}
