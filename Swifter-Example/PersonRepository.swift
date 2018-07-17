
import Foundation

class PersonRepository {
    
    let session = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    func getPeople(completion: @escaping ([Person]?, Error?) -> Void) {
        
        dataTask?.cancel()
        
        let url = URL(string: URLSettings().peopleURL)
        
        dataTask = session.dataTask(with: url!) { (data, response, error) in
            defer { self.dataTask = nil }
            
            DispatchQueue.main.async {
                if let data = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        let people = try decoder.decode([Person].self, from: data)
                        completion(people, nil)
                    } catch {
                        print("Error decoding person: \(error)")
                        completion(nil, error)
                    }
                    
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        dataTask?.resume()
    }
    
}
