protocol UserStorage: class {
    subscript<T>(key: String) -> T? { get set }
    func object(key: String) -> Any?
    func set(object: Any, for key: String)
    func removeObject(for key: String)
}

enum UserStorageKey: String {
    case isLogged
}
