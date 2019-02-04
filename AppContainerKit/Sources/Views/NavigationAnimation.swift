import UIKit

enum NavigationAnimation {
    case standard
    case fade
    
    var animator: UIViewControllerAnimatedTransitioning? {
        switch self {
        case .standard:
            return nil
        case .fade:
            return FadeTransitionAnimator()
        }
    }
}
