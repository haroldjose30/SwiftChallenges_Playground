import Foundation

/*
 Gas Station
 Have the function GasStation(strArr) take strArr which will be an an array consisting of the following elements:
 N which will be the number of gas stations in a circular route and each subsequent element will be the string g:c
 where g is the amount of gas in gallons at that gas station and c will be the amount of gallons of gas needed to
 get to the following gas station.
 
 For example strArr may be: ["4","3:1","2:2","1:2","0:1"].
 Your goal is to return the index of the starting gas station that will allow you to travel around the whole route once,
 otherwise return the string impossible. For the example above, there are 4 gas stations, and your program should return
 the string 1 because starting at station 1 you receive 3 gallons of gas and spend 1 getting to the next station.
 Then you have 2 gallons + 2 more at the next station and you spend 2 so you have 2 gallons when you get to the 3rd station.
 You then have 3 but you spend 2 getting to the final station, and at the final station you receive 0 gallons and you spend
 your final gallon getting to your starting point. Starting at any other gas station would make getting around the route
 impossible, so the answer is 1. If there are multiple gas stations that are possible to start at, return the smallest index
 (of the gas station). N will be >= 2.
 
 func GasStation(_ strArr: [String]) -> String {
 
 return strArr[0]
 
 }
 
 // keep this function call here
 print(GasStation(readLine(stripNewline: true)));
 */

public class GasStation {
    
    public func GasStation(_ strArr: [String]) -> String {
        
        let defaultRoute:[GasStationData] = strArr.enumerated().compactMap { (index, item) in
            
            let gasData = item.split(separator: ":")
            
            guard gasData.count == 2,
                  let gasReceived = Int(gasData[0]),
                  let gasConsumed = Int(gasData[1])
            else {
                return nil
            }
            
            return GasStationData(
                index: index,
                gasReceived: gasReceived,
                gasConsumed: gasConsumed
            )
        }
        
        var possiblesRoutesIndex: [Int] = []
        
        //try all possibles routes
        for i in 0..<defaultRoute.count {
            
            let currentRoute = Array(defaultRoute[i...] + defaultRoute[..<i])
            if isPossibleRoute(route: currentRoute) {
                possiblesRoutesIndex.append(currentRoute[0].index)
            }
        }
        
        let bestRouteIndex = possiblesRoutesIndex.min()
        
        guard let bestRouteIndexUnwrapped = bestRouteIndex else {
            return "impossible"
        }
        
        return String(bestRouteIndexUnwrapped)
    }
    
    //verify if this selected route is possible to be finished
    private func isPossibleRoute(route: [GasStationData]) -> Bool {
        
        var amountOfGas = 0
        
        for station in route {
            amountOfGas += station.gasReceived - station.gasConsumed
            if amountOfGas < 0 {
                return false
            }
        }
        
        return amountOfGas >= 0
    }
    
    private struct GasStationData {
        let index: Int
        let gasReceived: Int
        let gasConsumed: Int
    }
}


