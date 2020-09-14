import UIKit

final public class NavigationController: UINavigationController,
                                         CoordinatorContainer {
    
    // MARK: - Properties
    
    weak public var flowDelegate: Delegate? {
        didSet {
            DelegateHolder.instance.delegate = flowDelegate
        }
    }
    
    weak public var uiDelegate: UIDelegate? {
        didSet {
            DelegateHolder.instance.uiDelegate = uiDelegate
        }
    }
    
    var coordinator: NavigationCoordinator? {
        return navigationCoordinator
    }
    
    var navigationCoordinator: NavigationCoordinator? {
        didSet {
            delegate = navigationCoordinator
        }
    }
}
