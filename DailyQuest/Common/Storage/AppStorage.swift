//
//  AppStorage.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

final class AppStorage {

    static let shared: AppStorage = AppStorage()

    /// Storage entry point
    let userStorage: UserStorable

    private let secure: Storable

    private init() {
        secure = SecureStorage()

        userStorage = UserStorage(
            secure: secure
        )
    }
}

extension AppStorage {

    enum Key: String, CaseIterable {

        /// Key for app configs
        case appConfigs

        /// Key for user's authorization token
        case account

        /// Key for curent user profile data
        case profile

        /// Key for onboarding completion flag
        case onboardingCompleted

        /// Key for lastSugarBurnUpdatedTime
        case lastSugarBurnUpdatedTime

        /// Key for timer on Today screen
        case firstTimeTimer

        /// Key for storing social sign in profile
        case socialSignInProfile

        /// Token for push notifications APNs
        case pushNotificationToken
    }
}
