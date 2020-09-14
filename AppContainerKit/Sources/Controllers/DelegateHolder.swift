final class DelegateHolder {
    private init() {}
    static var instance: DelegateHolder = DelegateHolder()
    weak var delegate: Delegate?
    weak var uiDelegate: UIDelegate?
}
