import Foundation
import Security

final class SecureStorage: Storable {

    private let lock: NSLock = NSLock()

    @discardableResult
    func set<T>(value: T, for key: AppStorage.Key) -> Bool where T: Encodable {
        lock.lock()
        defer {
            lock.unlock()
        }

        let encoder = JSONEncoder()
        guard let data: Data = try? encoder.encode(value) else {
            return false
        }

        var query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
            kSecAttrAccount: key.rawValue
        ]
        var status: OSStatus = SecItemCopyMatching(query as CFDictionary, nil)

        switch status {
        case errSecSuccess:
            let attributesToUpdate: [CFString: Any] = [
                kSecValueData: data
            ]

            status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)

            return status == errSecSuccess
        case errSecItemNotFound:
            query[kSecValueData] = data
            status = SecItemAdd(query as CFDictionary, nil)

            return status == errSecSuccess
        default:
            return false
        }
    }

    func get<T>(for key: AppStorage.Key) -> T? where T: Decodable {
        lock.lock()
        defer {
            lock.unlock()
        }

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true,
            kSecAttrAccount: key.rawValue
        ]

        var result: AnyObject?
        let status: OSStatus = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }

        guard
            let data = result as? Data,
            status == errSecSuccess
        else {
            return nil
        }

        let decoder = JSONDecoder()

        return try? decoder.decode(T.self, from: data)
    }

    @discardableResult
    func delete(for key: AppStorage.Key) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue
        ]
        let status: OSStatus = SecItemDelete(query as CFDictionary)

        return status == errSecSuccess
    }

    @discardableResult
    func clear() -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword
        ]
        let status: OSStatus = SecItemDelete(query as CFDictionary)

        return status == errSecSuccess
    }
}
