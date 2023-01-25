import Foundation

public class CropMessage {
    
    public static func test() {
        
        assert(
            message: "       Codility  We  test         coders        ",
            K: 14
        )
        
        assert(
            message: "Codility We test coders",
            K: 14
        )
        
        assert(
            message: "Why not",
            K: 100
        )
        
        assert(
            message: "The quick brown fox jumps over the lazy dog",
            K: 39
        )
        
        assert(
            message: "To crop or not to crop",
            K: 21
        )
        
        assert(
            message: "Codility We test coders",
            K: -1
        )
        
        assert(
            message: "Codility We test coders",
            K: 501
        )
        
        assert(
            message: "",
            K: 501
        )
    }
    
    public static func assert(
        message : String,
        K : Int
    ) {
        var messageMutable = message
        let result = solution(
            &messageMutable,
            K
        )
        let resultNoSpace = result.replacingOccurrences(
            of: String.whiteSpace,
            with: "_"
        )
        print("result:\(resultNoSpace) | message:\(message) | K:\(K)")
        print("---------------------------------------------------------------------")
    }
    
    public static func solution(_ message : inout String, _ K : Int) -> String {
        
        //1 < K < 500
        guard
            K >= 1,
            K <= 500,
            //message non empty
            message != .empty
        else {
            return .empty
        }
        
        let messageWithOneSpace = removeTwoOrMoreSpacesBy1Space(message)
        let messageWithNoFirstLastSpaces = removeFirstAndEndSpaces(messageWithOneSpace)
        
        //it may not crop away part of a word
        //Output long as possible
        let splitedWords = messageWithNoFirstLastSpaces.split(separator: Character.whiteSpace)
       
        var result = String.empty
        for word in splitedWords {
            
            let wordCount = word.count
            let resultCount = result.count
            //Output mot exceed the K limit
            if (resultCount + wordCount) < K {
                
                if result.isEmpty {
                    result = String(word)
                } else{
                    result = result+String.whiteSpace+word
                }
                
                continue
            }
            break
        }
        return result
    }
}

//message can´t be >= 2 spaces consecutives
private func removeTwoOrMoreSpacesBy1Space(_ value: String) -> String {
    
    let twoWhiteSpace = String.whiteSpace+String.whiteSpace
    var oneSpaceString = value
    repeat {
        
        oneSpaceString = oneSpaceString.replacingOccurrences(
            of: twoWhiteSpace,
            with: String.whiteSpace
        )
        //if has TwoWhiteSpace continue
    } while oneSpaceString.contains(twoWhiteSpace)
    return oneSpaceString
}

//the output message may not end with a space
private func removeFirstAndEndSpaces(_ value: String) -> String {
    
    var removedFirstAndEndSpaces = value
    
    //remove fist
    if removedFirstAndEndSpaces.prefix(1) == String.whiteSpace {
        removedFirstAndEndSpaces.removeFirst()
    }
    
    //remove last
    if removedFirstAndEndSpaces.suffix(1) == String.whiteSpace {
        removedFirstAndEndSpaces.removeLast()
    }
    
    return removedFirstAndEndSpaces
}

public extension String {
    static var empty: String {
        return ""
    }
    
    static var whiteSpace: String {
        return " "
    }
}


public extension Character {
    static var whiteSpace: Character {
        return " "
    }
}




