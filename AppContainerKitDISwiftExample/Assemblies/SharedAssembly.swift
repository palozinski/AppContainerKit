import Swinject

final class SharedAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserStorage.self) { _ in
            return UserDefaults.standard
        }.inObjectScope(.container)
    }
}
