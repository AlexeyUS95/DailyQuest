//
//  Storable.swift
//  DailyQuest
//
//  Created by mac on 24.04.2025.
//

protocol Storable {

    @discardableResult
    func set<T: Encodable>(value: T, for key: AppStorage.Key) -> Bool

    func get<T>(for key: AppStorage.Key) -> T? where T: Decodable

    @discardableResult
    func delete(for key: AppStorage.Key) -> Bool

    @discardableResult
    func clear() -> Bool
}
