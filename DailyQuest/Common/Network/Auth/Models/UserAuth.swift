struct AuthResponse: Codable {

    let authToken: String
    let user: BriefUserProfile
}

struct BriefUserProfile: Codable {

    let id: String
    let email: String?
}
