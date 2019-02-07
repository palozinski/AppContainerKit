import UIKit
import MarkdownView

final class MainViewController: UIViewController {
    
    // MARK: - Injected
    
    var storage: UserStorage!
    var windowController: WindowController!
    
    // MARK: - Properties
    
    var isLogged: Bool = false {
        didSet {
            storage.isLogged = isLogged
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeMarkdownView()
    }
    
    private func customizeMarkdownView() {
        let bundle = Bundle.main
        let path = bundle.path(forResource: "README", ofType: "md")
        let string = try? String(contentsOfFile: path ?? "")
        (view as? MarkdownView)?.load(markdown: string)
    }
    
    // MARK: - Actions
    
    @IBAction private func logoutTapped() {
        isLogged = false
        windowController.performSwitch()
    }
}
