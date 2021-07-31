public struct ThenAnd {
    
    let ac: AC
    
    init(ac: AC, description: String, handler: AC.Handler?) rethrows {
        self.ac = ac
        ac.logger?.log(.init(clause: .then, description: description))
        try handler?()
    }
    
    public func and(_ description: String, _ handler: (AC.Handler)? = nil) rethrows -> And {
        try And(ac: ac, description: description, handler: handler)
    }
}
