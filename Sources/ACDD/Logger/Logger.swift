public protocol LoggerType {
    /// Called once for every AC
    func log(_ ac: AC)
    
    /// Called once for every clause in an AC
    func log(_ event: LoggerEvent)
}
