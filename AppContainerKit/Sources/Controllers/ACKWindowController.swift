import UIKit

open class APKWindowController {
    
    public init() {}
    
    public func performSwitch() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
}
