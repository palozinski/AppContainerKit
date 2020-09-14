import UIKit

public protocol Delegate: class {
    func shouldPresentPrimaryViewController() -> Bool
}

public protocol UIDelegate: class {
    func launchScreenViewController() -> UIViewController?
    func primaryViewController() -> UIViewController?
    func secondaryViewController() -> UIViewController?
}
