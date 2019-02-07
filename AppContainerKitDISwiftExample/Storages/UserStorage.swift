import Foundation

final class UserStorage {
    
    private let key = "isLogged"
    private lazy var defaults: UserDefaults = {
        return UserDefaults.standard
    }()
    
    var isLogged: Bool {
        set {
            defaults.set(newValue, forKey: key)
            defaults.synchronize()
        }
        get {
            return defaults.bool(forKey: key)
        }
    }
}
