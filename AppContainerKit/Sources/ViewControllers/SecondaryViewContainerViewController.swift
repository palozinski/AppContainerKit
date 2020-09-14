import UIKit

final class SecondaryViewContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    private var uiDelegate: UIDelegate? {
        return DelegateHolder.instance.uiDelegate
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
        (view as? ContainerView)?.present(child: viewController,
                                             onController: self)
    }
}
