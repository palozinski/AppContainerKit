import UIKit
import AppContainerKit
import SwinjectStoryboard

final class WindowController: APKWindowController,
                              ACKDelegate,
                              ACKUIDelegate {
    
    // MARK: - Properties
    
    private var isLogged: Bool {
        let value = storage.object(key: UserStorageKey.isLogged.rawValue) as? Bool
        return value ?? false
    }
    
    // MARK: - Initialized
    
    private let storage: UserStorage
    
    init(storage: UserStorage) {
        self.storage = storage
        super.init()
    }
    
    // MARK: - App Container Kit Delegate
    
    func shouldPresentPrimaryViewController() -> Bool {
        return isLogged
    }
    
    // MARK: - App Container Kit UI Delegate
    
    func launchScreenViewController() -> UIViewController? {
        return UIStoryboard(name: "LaunchScreen",
                            bundle: nil).instantiateInitialViewController()
    }
    
    func primaryViewController() -> UIViewController? {
        return SwinjectStoryboard.instantiateInContainer(storyboard: "Main",
                                                         bundle: nil)
    }
    
    func secondaryViewController() -> UIViewController? {
        return SwinjectStoryboard.instantiateInContainer(storyboard: "Authorization",
                                                         bundle: nil)
    }
}
