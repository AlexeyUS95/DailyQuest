import AuthenticationServices

protocol AuthService: AnyObject {

    /// creates account with email and password
    func register(email: String, password: String) async throws -> AuthResponse

    /// login user with credentials
    func login(email: String, password: String) async throws -> AuthResponse

    /// logout user
    func logout() async throws
}
