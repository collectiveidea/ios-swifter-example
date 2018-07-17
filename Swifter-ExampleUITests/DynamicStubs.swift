
import Foundation
import Swifter

class DynamicStubs {
    
    let server = HttpServer()
    
    func stubRequest(path: String, jsonData: Data) {
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) else {
            assertionFailure("Could not convert data to json")
            return
        }
        
        let response: ((HttpRequest) -> HttpResponse) = { _ in
            HttpResponse.ok(.json(json as AnyObject))
        }
        
        server.get[path] = response
    }
    
}
