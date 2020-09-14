import UIKit

open class WindowController {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Actions
    
    public func performSwitch() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
}
