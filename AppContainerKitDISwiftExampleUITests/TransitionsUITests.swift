import XCTest

final class TransitionsUITests: XCTestCase {

    private var app: XCUIApplication!
    private var waiterResult: XCTWaiter.Result {
        return XCTWaiter.wait(for: [expectation(description: "finish transitions")], timeout: 5)
    }

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testNewAppLaunch() {
        app.launchArguments.append("NoLoggedUser")
        app.launch()
        XCTAssertTrue(app.isDisplayingLoginView)
        app.buttons["LOGIN"].tap()
        if waiterResult == .timedOut {
            XCTAssertTrue(app.isDisplayingMainView)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testForLoggedUser() {
        app.launchArguments.append("LoggedUser")
        app.launch()
        XCTAssertTrue(app.isDisplayingMainView)
        app.buttons["Logout"].tap()
        if waiterResult == .timedOut {
            XCTAssertTrue(app.isDisplayingLoginView)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
