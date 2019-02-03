import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private var textFieldsContainerView: UIView! {
        didSet {
            textFieldsContainerView.layer.borderColor = UIColor.lightGray.cgColor
            textFieldsContainerView.layer.borderWidth = 2
            textFieldsContainerView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet private var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Injected
    
    var storage: UserStorage!
    var windowController: WindowController!
    
    // MARK: - Properties
    
    var isLogged: Bool = false {
        didSet {
            storage[UserStorageKey.isLogged.rawValue] = isLogged
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func logInTapped() {
        isLogged = true
        windowController.performSwitch()
    }
}
