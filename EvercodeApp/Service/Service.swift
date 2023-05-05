import Foundation

protocol ServiceProtocol {
    
    func fetchData(completion: ([String]?)->Void)
}

struct Service: ServiceProtocol {
    
    func fetchData(completion: ([String]?)->Void) {
        
        completion(["List Item 1",
                    "List Item 2",
                    "List Item 3",
                    "List Item 4",
                    "List Item 5",
                    "List Item 6",
                    "List Item 7",
                    "List Item 8",
                    "List Item 9",
                    "List Item 10"])
    }
}
