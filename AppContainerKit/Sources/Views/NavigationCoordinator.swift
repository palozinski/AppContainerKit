import UIKit

final class NavigationCoordinator: NSObject, UINavigationControllerDelegate {
    
    var nextAnimation: NavigationAnimation = .standard
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return pullNextAnimation()
    }
    
    private func pullNextAnimation() -> UIViewControllerAnimatedTransitioning? {
        let animator = nextAnimation.animator
        nextAnimation = .standard
        return animator
    }
}
