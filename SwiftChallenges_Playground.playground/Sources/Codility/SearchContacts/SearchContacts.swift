import Foundation

public class SearchContacts {
    
    public static func test() {
        
        assert(
            A: ["pim","pom"],
            B: ["999999999", "777888999"],
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
        
        let contacts: [Contact] = names.enumerated().map { (index, element) in
            return Contact(
                name: element,
                number: numbers[index]
            )
        }
        
        let contactsOrdered = contacts.sorted { item1, item2 in
            return item1.name < item2.name
        }
        
        let contactFounded = contactsOrdered.first { contact in
            return contact.number.contains(search)
        }
        
        guard
            let contactFoundedUnwrapped = contactFounded
        else {
            return "NO CONTACT"
        }
        
        return contactFoundedUnwrapped.name
    }
}


public struct Contact {
    let name: String
    let number: String
}
