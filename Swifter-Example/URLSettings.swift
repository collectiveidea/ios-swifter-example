
import Foundation

struct URLSettings {
    
    private var baseURL: String {
        get {
            return "https://not.real/swifterAPI"
        }
    }
    
    var peopleURL: String {
        get {
            return baseURL + "/people"
        }
    }
    
}
