//
//  ServiceResponse.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import Foundation

class ServiceResponse {
    static let shared = ServiceResponse()
    
    func getData(url: String, parameters: [String: String], completion: @escaping (_ status: Bool) -> Void){
        Authentication.shared.login(url: url, parameters: parameters, completion: {
            (data, error) in
            
            if error == nil{
                guard let jsonData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LoginModel.self, from: jsonData)
                    guard let status = result.status else { return }
                    if status == "true" {
                        completion(true)
                    }
                    completion(false)
                }catch{
                    
                }
            }
            
        })
    }
}
