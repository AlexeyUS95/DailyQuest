//
//  ValidationService.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 02.05.2025.
//

protocol ValidationService {

    func validate(value: String, rules: [ValidationRule]) -> ValidationResult

}

enum ValidationRule {

    case notEmpty
    case correctEmail
    case notShorterThan(Int)
    case notLongerThan(Int)
    case strongPassword
}

enum ValidationResult {

    case success
    case error(ValidationError)
}

enum ValidationError {
    case empty
    case notInRange
    case notValid
    case weakPassword
}
