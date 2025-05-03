//
//  MockValidationService.swift
//  DailyQuest
//
//  Created by mac on 02.05.2025.
//

final class MockValidationService: ValidationService {

    func validate(value: String, rules: [ValidationRule]) -> ValidationResult {
        .success
    }
}
