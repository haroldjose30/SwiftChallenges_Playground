import Foundation
import XCTest

///OrchardAliceAndBobTest.defaultTestSuite.run()
public class OrchardAliceAndBobTest: XCTestCase {
    
    private var orchardAliceAndBob: OrchardAliceAndBob!
    
    public override func setUp() {
        
        orchardAliceAndBob = OrchardAliceAndBob()
    }
    
    public func testCaseExample1() {
        
        //arrange
        var orchardRow = [6,1,4,6,3,2,7,4]
        let alice = 3
        let bob = 2
        let expected = 24
        
        //act
        let result = orchardAliceAndBob.solution(
            &orchardRow,
            alice,
            bob
        )
        
        //assert
        XCTAssertEqual(result, expected)
    }
    
//    public func testCaseExample2() {
//
//        //arrange
//        var orchardRow = [2,2,2,2,10,10,5,5]
//        let alice = 3
//        let bob = 2
//        let expected = 32
//
//        //act
//        let result = orchardAliceAndBob.solution(
//            &orchardRow,
//            alice,
//            bob
//        )
//
//        //assert
//        XCTAssertEqual(result, expected)
//    }
//
//    public func testCaseExample3() {
//
//        //arrange
//        var orchardRow = [10,19,15]
//        let alice = 2
//        let bob = 2
//        let expected = -1
//
//        //act
//        let result = orchardAliceAndBob.solution(
//            &orchardRow,
//            alice,
//            bob
//        )
//
//        //assert
//        XCTAssertEqual(result, expected)
//    }
//
//    public func testCaseExample4() {
//
//        //arrange
//        var orchardRow = [10,10,10,1,1,1,1,1]
//        let alice = 3
//        let bob = 2
//        let expected = 32
//        
//        //act
//        let result = orchardAliceAndBob.solution(
//            &orchardRow,
//            alice,
//            bob
//        )
//
//        //assert
//        XCTAssertEqual(result, expected)
//    }
}
