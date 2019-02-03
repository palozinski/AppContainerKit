import UIKit

class ACKLaunchScreenViewController: UIViewController {
    
    private enum ViewState: String {
        case primary
        case secondary
    }
    
    // MARK: - Properties
    
    private var delegate: ACKDelegate? {
        return ACKitDelegateHolder.instance.delegate
    }
    
    private var uiDelegat: ACKUIDelegate? {
        return ACKitDelegateHolder.instance.uiDelegate
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentLauchScreenViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootCoordinator?.nextAnimation = .fade
        let isLogged = delegate?.shouldPresentPrimaryViewController() ?? false
        let segueIdentifier: ViewState = isLogged ?
            .primary :
            .secondary
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
    
    private func presentLauchScreenViewController() {
        guard let launchScreenViewController = uiDelegat?.launchScreenViewController() else {
            return
        }
        (view as? ACKContainerView)?.present(child: launchScreenViewController,
                                             onController: self)
    }
}
