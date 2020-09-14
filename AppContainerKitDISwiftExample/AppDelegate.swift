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
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        resolve(resolver: resolver)
        observers?.forEach {
            _ = $0.application?(application, willFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow(container: resolver)
        return true
    }
    
    private func resolve(resolver: Resolver) {
        Container.loggingFunction = nil
        observers = resolver.resolve([UIApplicationDelegate].self,
                                     name: AssemblyCenter.Keys.appDelegateObserver.rawValue)
    }
    
    private func setupWindow(container: Resolver) {
        window = resolver.resolve(UIWindow.self)
        window?.makeKeyAndVisible()
        let initialViewController = SwinjectStoryboard.create(name: "Container",
                                                              bundle: Bundle(for: NavigationController.self),
                                                              container: resolver).instantiateInitialViewController()
        (initialViewController as? NavigationController)?
            .flowDelegate = resolver.resolve(WindowController.self)
        (initialViewController as? NavigationController)?
            .uiDelegate = resolver.resolve(WindowController.self)
        window?.rootViewController = initialViewController
    }
}
