import UIKit

final class UITestController: NSObject, UIApplicationDelegate {
    
    private let storage: UserStorage
    
    init(storage: UserStorage) {
        self.storage = storage
    }
    
    private var isLogged: Bool {
        get {
            return storage.isLogged
        }
        set {
            storage.isLogged = newValue
        }
    }
    // MARK: - Application Delegate
    
    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        checkForTests()
        return true
    }
    
    private func checkForTests() {
        let arguments = CommandLine.arguments
        if arguments.contains("LoggedUser") {
            isLogged = true
        } else if arguments.contains("NoLoggedUser") {
            isLogged = false
        }
    }
}
