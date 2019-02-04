final class ACKitDelegateHolder {
    private init() {}
    static var instance: ACKitDelegateHolder = ACKitDelegateHolder()
    weak var delegate: ACKDelegate?
    weak var uiDelegate: ACKUIDelegate?
}
