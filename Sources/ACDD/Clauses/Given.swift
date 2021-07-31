public struct Given {
    
    let ac: AC
    
    init(ac: AC, description: String, handler: AC.Handler?) rethrows {
        self.ac = ac
        ac.logger?.log(.init(clause: .given, description: description))
        try handler?()
    }
    
    public func and(_ description: String, _ handler: (AC.Handler)? = nil) rethrows -> AndWhen {
        try AndWhen(ac: ac, description: description, handler: handler)
    }
    
    public func when(_ description: String, _ handler: (AC.Handler)? = nil) rethrows -> WhenAnd {
        try WhenAnd(ac: ac, description: description, handler: handler)
    }
}
