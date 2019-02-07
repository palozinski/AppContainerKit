import XCTest

extension XCUIApplication {
    var isDisplayingMainView: Bool {
        return otherElements["MainView"].exists
    }
    
    var isDisplayingLoginView: Bool {
        return otherElements["LoginView"].exists
    }
}
