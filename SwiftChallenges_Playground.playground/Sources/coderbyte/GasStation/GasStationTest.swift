import Foundation
import XCTest

///GasStationTest.defaultTestSuite.run()
public class GasStationTest: XCTestCase {
    
    private var gasStation: GasStation!
    
    public override func setUp() {
        
        gasStation = GasStation()
    }
    
    public func testCaseExample1() {
        
        //arrange
        let route = ["4","3:1","2:2","1:2","0:1"]
        let expected = "1"
        
        //act
        let result = gasStation.GasStation(route)
        
        
        
        //assert
        XCTAssertEqual(result, expected)
    }
    
    public func testCaseExample2() {
        
        //arrange
        let route = ["4","2:2","1:2","3:1","0:1"]
        let expected = "3"
        
        //act
        let result = gasStation.GasStation(route)
        
        
        
        //assert
        XCTAssertEqual(result, expected)
    }
}
