// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

//MARK: - Custom Network Error Cases
enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

//MARK: - Network Service
open class NetworkService {
    static var networkService = NetworkService()
    
    public init(){}
    open func getData<T: Decodable>(urlString: String, completion: @escaping(Result<T,Error>) -> (Void)) {
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                print(NetworkError.wrongResponse)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print(NetworkError.wrongResponse)
                return
            }
            
            guard let data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success((object)))
                }
            } catch {
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .dataCorrupted(let context):
                        print("Data corrupted: \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("Key '\(key)' not found: \(context.debugDescription)")
                    case .typeMismatch(let type, let context):
                        print("Type mismatch: \(type), \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("Value not found: \(type), \(context.debugDescription)")
                    @unknown default:
                        print("Unknown decoding error occurred.")
                    }
                } else {
                    print("Error decoding JSON: \(error)")
                }
                completion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}
