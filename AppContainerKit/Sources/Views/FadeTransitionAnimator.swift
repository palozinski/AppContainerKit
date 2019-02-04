import UIKit

final class FadeTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    private let duration: TimeInterval = 0.3
    
    // MARK: - Actions
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        let containeView = transitionContext.containerView
        containeView.addSubview(toView)
        toView.alpha = 0
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1
        }, completion: {
            transitionContext.completeTransition($0)
        })
    }
}
