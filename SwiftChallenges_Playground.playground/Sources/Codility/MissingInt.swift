/*
 This is a demo task.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
 
 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
 
 Given A = [1, 2, 3], the function should return 4.
 
 Given A = [−1, −3], the function should return 1.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].
 
 */

public class MissingInt {
    
    public static func test(){
        
        var A:[Int] = [1,3,6,4,1,2]
        print("[1,3,6,4,1,2] -> expected 5:",solution(&A))
        
        var B:[Int] = [1,2,3]
        print("[1,2,3] -> expected 4:",solution(&B))
        
        var C:[Int] = [-1,-3]
        print("[-1,-3] -> expected 1:",solution(&C))
    }
    
    public static func solution(_ A : inout [Int]) -> Int {
        
        let validArray = A.filter({ $0 > 0})
        
        let min = validArray.min() ?? 0
        let max = validArray.max() ?? 0
        
        var selectedValue = 0
        for i in min...max {
            if !validArray.contains(where: {$0 == i}) {
                selectedValue = i
                break
            }
        }
        
        if selectedValue == 0 {
            selectedValue = max + 1
        }
        
        return selectedValue
        
    }
    
}


