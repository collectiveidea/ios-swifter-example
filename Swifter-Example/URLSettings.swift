
import Foundation

struct URLSettings {
    
    private var baseURL: String {
        get {
            if ProcessInfo.processInfo.arguments.contains("TESTING") {
                return "http://localhost:8080/"
            } else {
                return "http://collectiveidea.com/swifterAPI"
            }
        }
    }
    
    var peopleURL: String {
        get {
            return baseURL + "/people"
        }
    }
    
}
