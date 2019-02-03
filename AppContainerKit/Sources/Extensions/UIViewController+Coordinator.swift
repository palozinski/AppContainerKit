extension UIViewController {
    
    var rootCoordinator: NavigationCoordinator? {
        var nextParent: UIResponder? = self
        repeat {
            if let contained = (nextParent as? CoordinatorContainer)?.coordinator {
                return contained
            }
            nextParent = nextParent?.next
        } while nextParent != nil
        return nil
    }
}
