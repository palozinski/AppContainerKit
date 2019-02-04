import UIKit

final public class ACKNavigationController: UINavigationController, CoordinatorContainer {
    
    // MARK: - Properties
    
    weak public var flowDelegate: ACKDelegate? {
        didSet {
            ACKitDelegateHolder.instance.delegate = flowDelegate
        }
    }
    
    weak public var uiDelegate: ACKUIDelegate? {
        didSet {
            ACKitDelegateHolder.instance.uiDelegate = uiDelegate
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
