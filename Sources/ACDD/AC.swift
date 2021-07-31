public struct AC {
    
    public typealias Handler = () throws -> ()
        
    public let title: String?
    public let logger: LoggerType?
    
    public init(title: String? = nil, logger: LoggerType? = ACDD.defaultLogger) {
        self.title = title
        self.logger = logger
        logger?.log(self)
    }
    
    public func given(_ description: String, _ handler: Handler? = nil) rethrows -> Given {
        try Given(ac: self, description: description, handler: handler)
    }
    
    public func when(_ description: String, _ handler: (Handler)? = nil) rethrows -> WhenAnd {
        try WhenAnd(ac: self, description: description, handler: handler)
    }
}
