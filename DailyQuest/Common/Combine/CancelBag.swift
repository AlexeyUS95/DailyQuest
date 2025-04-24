//
//  CancelBag.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 24.04.2025.
//

import class Combine.AnyCancellable
import class Foundation.NSLock

/// Set of cancellables
final class CancelBag {

    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    private let lock: NSLock = NSLock()

    deinit {
        cancelAll()
    }

    /// Adds new cancellable to bag
    func insert(_ cancellable: AnyCancellable) {
        lock.lock()
        defer {
            lock.unlock()
        }
        subscriptions.insert(cancellable)
    }

    /// Checks if cancellable is already in bag
    func contains(_ cancellable: AnyCancellable) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return subscriptions.contains(cancellable)
    }

    /// Checks if cancellable is already in bag by predicate
    func contains(where predicate: (AnyCancellable) throws -> Bool) rethrows -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return try subscriptions.contains(where: predicate)
    }

    /// Removes cancellable from bag
    func cancel(_ cancellable: AnyCancellable) {
        lock.lock()
        defer {
            lock.unlock()
        }
        subscriptions.remove(cancellable)
    }

    /// Clears bag
    func cancelAll() {
        lock.lock()
        defer {
            lock.unlock()
        }
        subscriptions.removeAll()
    }
}
