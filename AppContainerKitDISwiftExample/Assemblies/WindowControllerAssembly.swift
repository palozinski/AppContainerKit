import Swinject
import SwinjectAutoregistration

final class WindowControllerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(WindowController.self,
                               initializer: WindowController.init)
            .inObjectScope(.container)
    }
}
