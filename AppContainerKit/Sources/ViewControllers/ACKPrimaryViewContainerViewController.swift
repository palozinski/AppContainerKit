import UIKit

final class ACKPrimaryViewContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    private var uiDelegate: ACKUIDelegate? {
        return ACKitDelegateHolder.instance.uiDelegate
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
        (view as? ACKContainerView)?.present(child: viewController,
                                             onController: self)
    }
}
