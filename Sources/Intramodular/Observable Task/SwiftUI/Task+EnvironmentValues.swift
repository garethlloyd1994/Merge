//
// Copyright (c) Vatsal Manot
//

import Combine
import Swift
import SwiftUI

extension EnvironmentValues {
    struct TaskDisabledEnvironmentKey: EnvironmentKey {
        static let defaultValue: Bool = false
    }

    struct TaskInterruptibleEnvironmentKey: EnvironmentKey {
        static let defaultValue: Bool = true
    }

    struct TaskRestartableEnvironmentKey: EnvironmentKey {
        static let defaultValue: Bool = true
    }

    var taskDisabled: Bool {
        get {
            self[TaskDisabledEnvironmentKey.self]
        } set {
            self[TaskDisabledEnvironmentKey.self] = newValue
        }
    }

    var taskInterruptible: Bool {
        get {
            self[TaskInterruptibleEnvironmentKey.self]
        } set {
            self[TaskInterruptibleEnvironmentKey.self] = newValue
        }
    }

    var taskRestartable: Bool {
        get {
            self[TaskRestartableEnvironmentKey.self]
        } set {
            self[TaskRestartableEnvironmentKey.self] = newValue
        }
    }
}

// MARK: - API -

extension View {
    public func taskDisabled(_ disabled: Bool) -> some View {
        environment(\.taskDisabled, disabled)
    }

    /// Sets whether tasks controlled by this view are interruptible or not.
    ///
    /// - Parameters:
    ///   - interruptible: If `false`, then the view is responsible for disabling user-interaction while its managed task is active. For e.g. if passed as `false` for a `TaskButton`, the button will be disabled while the task is running.
    public func taskInterruptible(_ interruptible: Bool) -> some View {
        environment(\.taskInterruptible, interruptible)
    }

    public func taskRestartable(_ restartable: Bool) -> some View {
        environment(\.taskRestartable, restartable)
    }
}
