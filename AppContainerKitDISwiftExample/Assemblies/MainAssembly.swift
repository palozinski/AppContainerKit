import Swinject
import SwinjectStoryboard

final class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(MainViewController.self) { resolver, controller in
            controller.storage = resolver.resolve(UserStorage.self)
            controller.windowController = resolver.resolve(WindowController.self)
        }
    }
}
