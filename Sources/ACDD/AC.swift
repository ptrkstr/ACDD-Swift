public struct AC {
    
    public typealias Handler = () throws -> ()
        
    public let scenario: String?
    public let logger: LoggerType?
    
    public init(scenario: String? = nil, logger: LoggerType? = ACDD.defaultLogger) {
        self.scenario = scenario
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
