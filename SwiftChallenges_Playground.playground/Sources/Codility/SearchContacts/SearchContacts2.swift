import Foundation

public class SearchContacts2 {
    
    public static func test() {
        
        assert(
            A: ["pim","pom"],
            B: ["999999999", "777888999"],
            P: "88999"
        )
        
        assert(
            A: ["pim","pom", "pam"],
            B: ["999999999", "777888999","188999111"],
            P: "88999"
        )
    }
    
    public static func assert(
        A : [String],
        B : [String],
        P : String
    ) {
        var names = A
        var numbers = B
        var search = P
        let result = solution(&names,&numbers,&search)
        print("result",result)
    }
    
    public static func solution(_ A : inout [String], _ B : inout [String], _ P : inout String) -> String {
        
        let names = A
        let numbers = B
        let search = P
        
        let selectedOrderedContact: [String] = names.enumerated().compactMap { (index, name) in
            if numbers[index].contains(search) {
                return name
            }
            
            return nil
        }.sorted()
        
        
        guard
            let selectedName = selectedOrderedContact.first
        else {
            return "NO CONTACT"
        }
        
        return selectedName
    }
}
