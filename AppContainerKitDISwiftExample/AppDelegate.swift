import UIKit
import Swinject
import SwinjectStoryboard
import AppContainerKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var observers: [UIApplicationDelegate]?
    private var resolver: Resolver {
        return AssemblyCenter
            .shared
            .container
            .resolver
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow(container: resolver)
        return true
    }
    
    private func setupWindow(container: Resolver) {
        window = resolver.resolve(UIWindow.self)
        window?.makeKeyAndVisible()
        let initialViewController = SwinjectStoryboard.create(name: "Container",
                                                              bundle: Bundle(for: ACKNavigationController.self),
                                                              container: resolver).instantiateInitialViewController()
        (initialViewController as? ACKNavigationController)?
            .flowDelegate = resolver.resolve(WindowController.self)
        (initialViewController as? ACKNavigationController)?
            .uiDelegate = resolver.resolve(WindowController.self)
        window?.rootViewController = initialViewController
    }
}
