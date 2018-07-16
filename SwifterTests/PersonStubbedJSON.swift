
import Foundation

struct PersonStubbedJSON {
    
    let jsonString = """
        [
            {
                "name": "Johnny McBiggs",
                "favoriteThings": [
                    "Sausages",
                    "Pancackes",
                    "Cheeseburgers"
                ]
            },
            {
                "name": "Nancy Foofoo",
                "favoriteThings": [
                    "Sprinkles",
                    "Puppies",
                    "Unicorns"
                ]
            }
        ]
    """
    
    var jsonData: Data? {
        get {
            return jsonString.data(using: .utf8)
        }
    }
    
}
