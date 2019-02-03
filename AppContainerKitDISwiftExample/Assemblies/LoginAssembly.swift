import Swinject
import SwinjectStoryboard

final class LoginAssembly: Assembly {
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(LoginViewController.self) { resolver, controller in
            controller.storage = resolver.resolve(UserStorage.self)
            controller.windowController = resolver.resolve(WindowController.self)
        }
    }
}
