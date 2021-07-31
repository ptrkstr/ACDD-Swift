public struct AndThen {
    
    let ac: AC
    
    init(ac: AC, description: String, handler: AC.Handler?) rethrows {
        self.ac = ac
        ac.logger?.log(.init(clause: .and, description: description))
        try handler?()
    }
    
    public func and(_ description: String, _ handler: (AC.Handler)? = nil) rethrows -> AndThen {
        try AndThen(ac: ac, description: description, handler: handler)
    }
    
    @discardableResult
    public func then(_ description: String, _ handler: (() throws -> ())? = nil) rethrows -> ThenAnd {
        try ThenAnd(ac: ac, description: description, handler: handler)
    }
}
