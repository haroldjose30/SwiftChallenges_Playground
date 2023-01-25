import Foundation

public class CropMessage2 {
    
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
        
        if message.count <= K {
            return message
        }
        
        return message.split(separator: " ").reduce("") { partialMessage, word in
            
            if (partialMessage+word).count <= K {
                return  partialMessage == "" ? String(word) : String(partialMessage+" "+word)
            }
            
            return partialMessage
        }
    }
}

