/*
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
 
 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.
 
 Write a function:
 
 class Solution { public int solution(int N); }
 
 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
 
 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..2,147,483,647].
 */

public class BinaryGap {

    public static func test() {
        
        print("9 > 1001 expected 2: ", solution(N: 9))
        print("------------------------------")
        print("529 > 1000010001 expected 4: ", solution(N: 529))
        print("------------------------------")
        print("20 > 10100 expected 1: ", solution(N: 20))
        print("------------------------------")
        print("15 > 1111 expected 0: ", solution(N: 15))
        print("------------------------------")
        print("32 > 100000 expected 0: ", solution(N: 32))
        print("------------------------------")
        print("1041 > 10000010001 expected 5: ", solution(N: 1041))
        print("------------------------------")
        print("2147483647 > ? expected ?: ", solution(N: 2147483647))
    }
    
    public static func solution(N: Int) -> Int {
        
        let binaryString = String(N, radix: 2)
        print("binaryString:", binaryString)
        var maxBinaryGap = 0
        var zeroCount = 0
        for char in binaryString {
            
            //print("char:", char)
            if char == "1" {
                
                updateMaxBinaryGapIfNeeded(
                    maxBinaryGap: &maxBinaryGap,
                    zeroCount: zeroCount
                )
                
                zeroCount = 0
            } else {
                zeroCount += 1
            }
        }
        
        return maxBinaryGap
    }
    
    public static func updateMaxBinaryGapIfNeeded(
        maxBinaryGap: inout Int,
        zeroCount: Int
    ) {
        if maxBinaryGap < zeroCount {
            
            maxBinaryGap = zeroCount
            //print("maxBinaryGap:",maxBinaryGap)
        }
    }
}
