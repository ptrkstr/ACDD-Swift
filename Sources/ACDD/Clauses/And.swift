public struct And {
    
    let ac: AC
    
    init(ac: AC, description: String, handler: AC.Handler?) rethrows {
        self.ac = ac
        ac.logger?.log(.init(clause: .and, description: description))
        try handler?()
    }
    
    @discardableResult
    public func and(_ description: String, _ handler: (AC.Handler)? = nil) rethrows -> And {
        try And(ac: ac, description: description, handler: handler)
    }
}
