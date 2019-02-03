public protocol ACKDelegate: class {
    func shouldPresentPrimaryViewController() -> Bool
}

public protocol ACKUIDelegate: class {
    func launchScreenViewController() -> UIViewController?
    func primaryViewController() -> UIViewController?
    func secondaryViewController() -> UIViewController?
}
