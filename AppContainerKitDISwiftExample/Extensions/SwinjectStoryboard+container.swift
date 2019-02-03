import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    static func instantiateInContainer(storyboard name: String,
                                       bundle: Bundle?) -> UIViewController? {
        return SwinjectStoryboard.create(name: name,
                                         bundle: bundle,
                                         container: container).instantiateInitialViewController()
    }
    
    private static var container: Resolver {
        return AssemblyCenter.shared.container.resolver
    }
}
