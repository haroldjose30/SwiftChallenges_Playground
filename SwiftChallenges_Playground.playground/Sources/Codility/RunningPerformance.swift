import Foundation

public class RunningPerformance {
    
    public static func track(
        blockName: String = "Time",
        executionBlock: @escaping () -> ()
    ) {
        
        let start = Date()
        executionBlock()
        let end = Date()
        let diffSeconds = end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate
        
        print("Execution of \(blockName): \(diffSeconds) seconds")
        
    }
}
