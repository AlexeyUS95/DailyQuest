//
//  UserProfile.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

import Foundation

struct UserProfile: Codable, Equatable {

    let id: String
    let email: String?
    var firstName: String?
}
