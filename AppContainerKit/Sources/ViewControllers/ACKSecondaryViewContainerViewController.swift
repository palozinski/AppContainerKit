import UIKit

final class ACKSecondaryViewContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    private var uiDelegate: ACKUIDelegate? {
        return ACKitDelegateHolder.instance.uiDelegate
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentSecondaryViewController()
    }
    
    private  func presentSecondaryViewController() {
        guard let viewController = uiDelegate?.secondaryViewController() else {
            fatalError("You should implement secondaryViewController() method")
        }
        (view as? ACKContainerView)?.present(child: viewController,
                                             onController: self)
    }
}
