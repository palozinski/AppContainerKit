import UIKit

open class APKWindowController {
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Actions
    
    public func performSwitch() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
}
