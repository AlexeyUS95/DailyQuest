//
//  UserStorage.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

import struct Foundation.TimeInterval
import Foundation.NSData

final class UserStorage {

    let secure: Storable

    init(secure: Storable) {
        self.secure = secure
    }
}

extension UserStorage: UserStorable {

    var account: Account? {
        get { secure.get(for: .account) }
        set {
            if let value = newValue {
                secure.set(value: value, for: .account)
            } else {
                secure.delete(for: .account)
            }
        }
    }

    func clearStorage() {
        secure.clear()
    }
}
