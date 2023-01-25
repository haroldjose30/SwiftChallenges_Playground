
/*
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index,
 and the last element of the array is moved to the first place. For example, the rotation of array
 A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
 
 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ K : Int) -> [Int]
 
 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
 
 For example, given
 
 A = [3, 8, 9, 7, 6]
 K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:
 
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 For another example, given
 
 A = [0, 0, 0]
 K = 1
 the function should return [0, 0, 0]
 
 Given
 
 A = [1, 2, 3, 4]
 K = 4
 the function should return [1, 2, 3, 4]
 
 Assume that:
 
 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 */
public class CyclicRotation0 {
    
    public static func test(){
        
        Assert(
            inputArray: [3, 8, 9, 7, 6],
            shiftTimes: 1,
            expectedArray: [6, 3, 8, 9, 7]
        )
        
        Assert(
            inputArray: [3, 8, 9, 7, 6],
            shiftTimes: 3,
            expectedArray: [9, 7, 6, 3, 8]
        )
        
        Assert(
            inputArray: [0, 0, 0],
            shiftTimes: 1,
            expectedArray: [0, 0, 0]
        )
        
        Assert(
            inputArray: [1, 2, 3, 4],
            shiftTimes: 4,
            expectedArray: [1, 2, 3, 4]
        )
        
        Assert(
            inputArray: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
            shiftTimes: 51,
            expectedArray: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        )
        
        Assert(
            inputArray: [1],
            shiftTimes: 4,
            expectedArray: [1]
        )
        
        Assert(
            inputArray: [-1, 1],
            shiftTimes: 1,
            expectedArray: [1, -1]
        )
        
        Assert(
            inputArray: [],
            shiftTimes: 2,
            expectedArray: []
        )
        
        Assert(
            inputArray: [],
            shiftTimes: 0,
            expectedArray: []
        )
    }
    
    static func Assert(
        inputArray: [Int],
        shiftTimes: Int,
        expectedArray: [Int]
    ){
        var mutableInputArray = inputArray
        let result = solution(&mutableInputArray, shiftTimes)
        print(
            "Assert:\(expectedArray==result) ",
            "Input:\(inputArray) ",
            "shiftTimes:\(shiftTimes) ",
            "Expected:\(expectedArray) ",
            "Result:\(result) "
        )
    }
    
    
    public static func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        
        guard K >= 1 else {
            return  A
        }
        
        for _ in 1...K {
            
            A = shiftArray(
                array: A
            )
        }
        
        return A
    }
    
    private static func shiftArray(
        array: [Int]
    ) -> [Int] {
        
        guard let lastItem = array.last else {
            return array
        }
        let arrayWithoutLast = array.dropLast()
        let shiftedArray = [lastItem] + arrayWithoutLast
        return shiftedArray
    }
    
}
