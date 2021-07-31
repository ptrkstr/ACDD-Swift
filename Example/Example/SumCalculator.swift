import Foundation

struct SumCalculator {
    var firstNumber: Int?
    var secondNumber: Int?
    private(set) var output: Int?
    
    mutating func computeSum() throws {
        guard let firstNumber = firstNumber else {
            throw RuntimeError("Missing `firstNumber`")
        }
        
        guard let secondNumber = secondNumber else {
            throw RuntimeError("Missing `secondNumber`")
        }
        
        output = firstNumber + secondNumber
    }
}
