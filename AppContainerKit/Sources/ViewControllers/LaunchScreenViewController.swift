import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private enum ViewState: String {
        case primary
        case secondary
    }
    
    // MARK: - Properties
    
    private var delegate: Delegate? {
        return DelegateHolder.instance.delegate
    }
    
    private var uiDelegat: UIDelegate? {
        return DelegateHolder.instance.uiDelegate
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
        (view as? ContainerView)?.present(child: launchScreenViewController,
                                          onController: self)
    }
}
