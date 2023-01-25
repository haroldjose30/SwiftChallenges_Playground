
/*
 A non-empty array A consisting of N integers is given. The array contains an odd number of elements,
 and each element of the array can be paired with another element that has the same value,
 except for one element that is left unpaired.
 
 For example, in array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:
 
 class Solution { public int solution(int[] A); }
 
 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
 
 For example, given array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the function should return 7, as explained in the example above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.
 */
public class OddOccurrencesInArray {
    
    public static func test() {
        
                assert(
                    array: [9,3,9,3,9,7,9],
                    expected: 7
                )
        
                assert(
                    array: [9,3,9,3,9,7,9,7],
                    expected: 0
                )
        
                assert(
                    array: [9],
                    expected: 9
                )
        
                assert(
                    array: [9,9],
                    expected: 0
                )
        
                assert(
                    array: [],
                    expected: 0
                )
        
                assert(
                    array: [8,3,8,3,8,7,8,7,8],
                    expected: 8
                )
    }
    
    public static func assert(
        array: [Int],
        expected: Int
    ) {
        
        var A = array
        let result = solutionFromChatGpt2(&A)
        print(
            "Assert:\(result==expected ? "✅" : "❌")",
            //"input:\(array)",
            "expected:\(expected)",
            "result:\(result)"
        )
    }
    
    
    public static func solution(_ A : inout [Int]) -> Int {
        
        let grouped: Dictionary<Int,[Int]> = Dictionary(grouping: A) { item in
            item
        }
        
        let unpaired: Int? = grouped.first(where: { groupedItem in
            (groupedItem.value.count) % 2 != 0
        })?.key
        
        
        return unpaired ?? 0
    }
    
    public static func solutionFromChatGpt(_ A: inout [Int]) -> Int {
        
        // Create a dictionary to store the count of each element in the array
        var countDict = [Int: Int]()
        
        // Iterate through the array and count the number of occurrences of each element
        for element in A {
            if let count = countDict[element] {
                countDict[element] = count + 1
            } else {
                countDict[element] = 1
            }
        }
        
        // Iterate through the dictionary and return the key of the first element with an odd count
        for (key, value) in countDict {
            if value % 2 == 1 {
                return key
            }
        }
        
        // If no element is found with an odd count, return 0
        return 0
    }
    
    public static func solutionFromChatGpt2(_ A : inout [Int]) -> Int {
        
        //To solve this problem, you can use the XOR (exclusive or) operator in Swift.
        //The XOR operator compares two values bit by bit, and if the bits are different,
        //it will return 1, otherwise it will return 0. You can use the XOR operator to solve
        //this problem because it has the following properties:

        
        var result = 0
        
        for num in A {
            
            print("num:",num)
            print("result:",result)
            print("result ^ num:",result ^ num)
            print("--------------------------")
            result = result ^ num
            
        }
        
        return result
    }
}


