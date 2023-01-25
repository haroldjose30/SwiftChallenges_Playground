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

public class OrchardAliceAndBob {
    
    public func solution(_ A : inout [Int], _ K : Int, _ L: Int) -> Int {
        
        let orchardRow = A
        let alice = K
        let bob = L
        
        guard (alice+bob) <= orchardRow.count else {
            return -1
        }
        
        var finalResult = FinalResult()
        
        for aliceIndex in 0..<orchardRow.endIndex {
            
            //Alice
            guard
                let aliceSlices = getItems(
                    array: orchardRow,
                    quantityOfItens: alice,
                    from: aliceIndex
                )
            else {
                break
            }
            
            let aliceResult = PartialResult(array: aliceSlices.selectedSlice)
            
            
            //Bob from left
            let bobLeftResult = getBestResultFor(
                array: aliceSlices.leftSlice,
                quantityOfItens: bob
            )
            
            //Bob from right
            let bobRightResult = getBestResultFor(
                array: aliceSlices.rightSlice,
                quantityOfItens: bob
            )
            
            //select best option for bob
            let bobFinalResult = bobLeftResult.total < bobRightResult.total ? bobRightResult : bobLeftResult
            
            let finalResultLocal = FinalResult(
                aliceResult: aliceResult,
                bobResult: bobFinalResult
            )
            
            //compare if new combination is higher
            if finalResult.total < finalResultLocal.total {
                finalResult = finalResultLocal
            }
        }
        
        return finalResult.total
    }
    
    private func getBestResultFor(
        array: [Int],
        quantityOfItens: Int
    ) -> PartialResult {
        var result = PartialResult()
        for index in 0..<array.endIndex {
            
            guard
                let slices = getItems(
                    array: array,
                    quantityOfItens: quantityOfItens,
                    from: index
                )
            else {
                break
            }
            
            let resultTemporary = PartialResult(array: slices.selectedSlice)
            if result.total < resultTemporary.total {
                result = resultTemporary
            }
        }
        
        return result
    }
    
    private func getItems(
        array: [Int],
        quantityOfItens quantity: Int,
        from index: Int
    ) -> (selectedSlice:[Int], leftSlice: [Int], rightSlice:[Int] )? {
        
        guard quantity > 0,
              quantity+index <= array.count
        else {
            return nil
        }
        
        let selectedSlice = Array(array[index..<quantity+index])
        
        var leftSlice:[Int] = []
        if index > 0 {
            leftSlice = Array(array[array.startIndex..<index])
            
        }
        
        var rightSlice:[Int] = []
        if (index+quantity) < array.endIndex {
            rightSlice = Array(array[(index+quantity)..<array.endIndex])
        }
        
        let tuple =  (selectedSlice, leftSlice, rightSlice)
        
        return tuple
    }
}

private struct FinalResult {
    
    var aliceResult: PartialResult = PartialResult()
    var bobResult: PartialResult = PartialResult()
    
    var total: Int {
        return aliceResult.total + bobResult.total
    }
}

private struct PartialResult {
    var array: [Int] = []
    var total: Int {
        return array.reduce(0) { partialResult, item in
            return partialResult + item
        }
    }
}
