public struct SimpleLogger: LoggerType {
    
    public init() {}
    
    public func log(_ ac: AC) {
        if let scenario = ac.scenario {
            print("AC - \(scenario)")
        } else {
            print("AC")
        }
    }
    
    public func log(_ event: LoggerEvent) {
        let prefix: String = {
            switch event.clause {
            case .given:    return "GIVEN"
            case .when:     return "WHEN"
            case .then:     return "THEN"
            case .and:      return "AND"
            }
        }()
        print("- \(prefix) \(event.description)")
    }
}
