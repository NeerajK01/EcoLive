//
//  LoginModel.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import Foundation

struct LoginModel: Decodable {
    var data: DataModel?
    var message: String?
    var status: String?
}

struct DataModel: Decodable {
    var email: String?
    var password: String?
    var firstname: String?
    var lastname: String?
    var contactno: String?
}
