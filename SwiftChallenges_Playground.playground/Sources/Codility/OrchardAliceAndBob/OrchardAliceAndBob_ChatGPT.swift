import Foundation

/*
 
 Alice and Bob work in a beautiful orchard. There are N apple trees in the orchard. The apple trees are arranged in a row and they are numbered from 1 to N.
 Alice is planning to collect all the apples from K consecutive trees and Bob is planning to collect all the apples from L consecutive trees. They want to choose two
 disjoint segments (one consisting of K trees for Alice and the other consisting of L trees for Bob) so as not to disturb each other. What is the maximum number of
 apples that they can collect?
 
 solution(_ A : inout [Int], _ K : Int, _ L: Int) -> Int
 
 that, given an array A consisting of N integers denoting the number of apples on each apple tree in the row, and integers K and L denoting, respectively, the number
 of trees that Alice and Bob can choose when collecting, returns the maximum number of apples that can be collected by them, or -1 if there are no such intervals.
 For example, given A = [6, 1, 4, 6, 3, 2, 7, 4], K = 3, L = 2, your function should return 24, because Alice can choose trees 3 to 5 and collect 4 + 6 + 3 = 13 apples, and
 Bob can choose trees 7 to 8 and collect 7 + 4 = 11 apples. Thus, they will collect 13 + 11 = 24 apples in total, and that is the maximum number that can be achieved.
 Given A = [10, 19, 15], K = 2, L = 2, your function should return -1, because it is not possible for Alice and Bob to choose two disjoint intervals
 
 Assume that:
 • N is an integer within the range [2.100];
 • K and L are integers within the range [1.N - 1];
 each element of array A is an integer within the range [1..500].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 
 */

public class OrchardAliceAndBob_ChatGPT {
    
    //Solution from ChatGPT
    public func solution(_ A : inout [Int], _ K : Int, _ L: Int) -> Int {
        
        let orchardRow = A
        let alice = K
        let bob = L
        print("orchardRow:",orchardRow, "alice:",alice, "bob:", bob)
        
        if alice + bob > orchardRow.count {
            return -1
        }
        
        var maxApples = 0
        
        for i in 0...(orchardRow.count - alice) {
            
            for j in 0...(orchardRow.count - bob) {
                //[6, 1, 4, 6, 3, 2, 7, 4]
                print("i:",i," j:",j)
                print("i + alice <= j \(i + alice <= j)")
                print("j + bob <= i \(j + bob <= i)")
                if i + alice <= j || j + bob <= i {
                    
                    let aliceCurrentApples = orchardRow[i..<(i+alice)].reduce(0, +)
                    print("aliceCurrentApples:",aliceCurrentApples, " ", orchardRow[i..<(i+alice)])
                    
                    let bobCurrentApples = orchardRow[j..<(j+bob)].reduce(0, +)
                    print("bobCurrentApples:",bobCurrentApples, " ",  orchardRow[j..<(j+bob)])
                    
                    let currentApples = aliceCurrentApples + bobCurrentApples
                    print("maxApples:",maxApples," currentApples:",currentApples)
                    maxApples = max(maxApples, currentApples)
                    print("----------------------------------")
                }
            }
        }
        return maxApples
    }
}
