import Foundation

final class AuthServiceImpl: AuthService {

    /// creates account with email and password
    func register(email: String, password: String) async throws -> AuthResponse {
        AuthResponse(authToken: "mock token", user: BriefUserProfile(id: "12345", email: "alexey@gmail.com"))
    }

    /// login user with credentials
    func login(email: String, password: String) async throws -> AuthResponse {
        AuthResponse(authToken: "mock token", user: BriefUserProfile(id: "12345", email: "alexey@gmail.com"))
    }

    /// logout user
    func logout() async throws { }
}
