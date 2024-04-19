//
//  GetObjects.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class NetworkService {
    func getPosts(urlString: String, completion: @escaping (PostsResponseData?,Error?) -> (Void)) {
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            
            guard let data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(PostsResponseData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(object, nil)
                }
            } catch {
                print("Decoding error:", error.localizedDescription)
                completion(nil, NetworkError.decodeError)
            }
        }.resume()
    }
}
