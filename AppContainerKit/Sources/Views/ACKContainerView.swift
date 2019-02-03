import UIKit

class ACKContainerView: UIView {
    
    @IBInspectable var transitionDuration: Double = 0.3
    private(set) weak var currentChild: UIViewController?
    
    func present(child: UIViewController, onController parent: UIViewController) {
        if currentChild == nil {
            add(child: child, toController: parent)
        } else {
            swap(to: child, parent: parent)
        }
    }
    
    private func add(child: UIViewController,
                     toController parent: UIViewController) {
        parent.addChild(child)
        child.view.frame = bounds
        addSubview(child.view)
        child.didMove(toParent: parent)
        currentChild = child
    }
    
    private func swap(to child: UIViewController,
                      parent: UIViewController) {
        guard let old = currentChild else { return }
        currentChild = child
        old.willMove(toParent: nil)
        parent.addChild(child)
        child.view.frame = bounds
        parent.transition(from: old,
                          to: child,
                          duration: TimeInterval(transitionDuration),
                          options: [.transitionCrossDissolve],
                          animations: nil,
                          completion: {_ in
                            old.removeFromParent()
                            child.didMove(toParent: parent)
        })
    }
    
    func remove(from parent: UIViewController) {
        guard let current = currentChild else {
            return
        }
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        currentChild = nil
    }
}
