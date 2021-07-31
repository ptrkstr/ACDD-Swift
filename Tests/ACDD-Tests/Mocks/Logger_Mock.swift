@testable import ACDD_Swift

struct Logger_Mock: LoggerType {
    
    var didLogAC: ((AC) -> ())?
    var didLogEvent: ((_ event: LoggerEvent) -> ())?
    
    func log(_ ac: AC) {
        didLogAC?(ac)
    }
    
    func log(_ event: LoggerEvent) {
        didLogEvent?(event)
    }
}
