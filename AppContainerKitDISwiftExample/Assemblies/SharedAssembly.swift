import Swinject

final class SharedAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(UserStorage.self, initializer: UserStorage.init)
            .inObjectScope(.container)
    }
}
