//
//  Account.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import Foundation

enum Account: Codable {

    case authorized(token: String)
    case unauthorized
}
