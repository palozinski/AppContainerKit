import UIKit

final class PrimaryViewContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    private var uiDelegate: UIDelegate? {
        return DelegateHolder.instance.uiDelegate
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentPrimaryViewController()
    }
    
    private  func presentPrimaryViewController() {
        guard let viewController = uiDelegate?.primaryViewController() else {
            fatalError("You should implement primaryViewController() method")
        }
        (view as? ContainerView)?.present(child: viewController,
                                             onController: self)
    }
}
