import Foundation
import Swinject

final class AssemblyCenter {
    
    static let shared = AssemblyCenter()
    
    private(set) lazy var container: Assembler = {
        return Assembler(assemblies)
    }()
    
    private var assemblies: [Assembly] {
        return [
            AppDelegateAssembly(),
            SharedAssembly(),
            WindowControllerAssembly(),
            MainAssembly(),
            LoginAssembly()
        ]
    }
}
