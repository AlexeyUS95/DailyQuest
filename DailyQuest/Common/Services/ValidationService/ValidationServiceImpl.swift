//
//  ValidationServiceImpl.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 02.05.2025.
//

import class Foundation.NSPredicate

class ValidationServiceImpl: ValidationService {

    func validate(value: String, rules: [ValidationRule]) -> ValidationResult {
        for rule in rules {

            switch rule {
            case .notEmpty:
                if value.isEmpty {
                    return .error(.empty)
                }

            case .correctEmail:
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
                if !predicate.evaluate(with: value) {
                    return .error(.notValid)
                }

            case .notShorterThan(let minLength):
                if value.count < minLength {
                    return .error(.notInRange)
                }

            case .notLongerThan(let maxLength):
                if value.count < maxLength {
                    return .error(.notInRange)
                }

            case .strongPassword:
                let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\p{P}\\p{S}\\p{L}\\p{N}])[\\p{L}\\p{N}\\p{P}\\p{S}]{10,}$"
                let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
                if !predicate.evaluate(with: value) {
                    return .error(.notValid)
                }
            }
        }

        return .success
    }
}
