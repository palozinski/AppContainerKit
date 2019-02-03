import UIKit

extension UserDefaults: UserStorage {
    
    subscript<T>(key: String) -> T? {
        get {
            return object(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
            save()
        }
    }
    
    func object(key: String) -> Any? {
        return object(forKey: key)
    }
    
    func set(object: Any, for key: String) {
        set(object, forKey: key)
        save()
    }
    
    func removeObject(for key: String) {
        removeObject(forKey: key)
        save()
    }
    
    private func save() {
        synchronize()
    }
}
