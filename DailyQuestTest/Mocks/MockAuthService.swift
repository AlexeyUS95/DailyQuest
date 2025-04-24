//
//  MockAuthService.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

final class MockAuthService: AuthService {

    func register(email: String, password: String) async throws -> AuthResponse {
        AuthResponse(authToken: "12345", user: BriefUserProfile(id: "123", email: "alex@gmail.com"))
    }

    func login(email: String, password: String) async throws -> AuthResponse {
        AuthResponse(authToken: "12345", user: BriefUserProfile(id: "123", email: "alex@gmail.com"))
    }

    func logout() async throws {}
}
