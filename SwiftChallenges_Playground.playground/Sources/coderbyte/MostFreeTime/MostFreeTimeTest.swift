import Foundation
import XCTest

///MostFreeTimeTest.defaultTestSuite.run()
public class MostFreeTimeTest: XCTestCase {
    
    private var mostFreeTime: MostFreeTime!
    
    public override func setUp() {
        
        mostFreeTime = MostFreeTime()
    }
    
    public func testCaseExample1() {
        
        //arrange
        let events = ["12:15PM-02:00PM","09:00AM-10:00AM","10:30AM-11:00AM"]
        let expected = "01:15"
        
        //act
        let result = mostFreeTime.MostFreeTime(events)
        
        //assert
        XCTAssertEqual(result, expected)
    }
    
    public func testCaseExample2() {
        
        //arrange
        let events = ["12:15PM-02:00PM","09:00AM-10:00AM","10:30AM-12:00PM"]
        let expected = "00:30"
        
        //act
        let result = mostFreeTime.MostFreeTime(events)
        
        //assert
        XCTAssertEqual(result, expected)
    }
    
    public func testCaseExample3() {
        
        //arrange
        let events = ["12:15PM-02:00PM","09:00AM-12:11PM","02:02PM-04:00PM"]
        let expected = "00:04"
        
        //act
        let result = mostFreeTime.MostFreeTime(events)
        
        //assert
        XCTAssertEqual(result, expected)
    }
}
