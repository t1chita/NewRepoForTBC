//
//  GetObjects.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 20.04.24.
//

import UIKit

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}


class NetworkService {
    func getCountryInfo(urlString: String, completion: @escaping([Country]?,Error?) -> (Void)) {
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
                let object = try decoder.decode([Country].self, from: data)
                
                DispatchQueue.main.async {
                    completion(object, nil)
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
                completion(nil, NetworkError.decodeError)
            }
        }.resume()
    }
}
