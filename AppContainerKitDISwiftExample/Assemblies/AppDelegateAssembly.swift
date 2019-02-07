import Swinject

final class AppDelegateAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UIWindow.self) { _ in
            return UIWindow(frame: UIScreen.main.bounds)
        }
        
        container.register([UIApplicationDelegate].self,
                           name: AssemblyCenter.Keys.appDelegateObserver.rawValue) { resolver in
                            return [
                                resolver.resolve(UITestController.self)!
                            ]
        }
        
        container.autoregister(UITestController.self, initializer: UITestController.init)
    }
}

extension AssemblyCenter {
    enum Keys: String {
        case appDelegateObserver
    }
}
