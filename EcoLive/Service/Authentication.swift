//
//  Authentication.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import Foundation
class Authentication {
    
    static let shared = Authentication()
    
    func login(url: String, parameters: [String: String], completion: @escaping (_ data: Data?, _ error: Error?) -> Void){
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard let getData = data else {
                completion(nil, error)
                return
            }
            completion(getData, error)
        }.resume()
    }
}
