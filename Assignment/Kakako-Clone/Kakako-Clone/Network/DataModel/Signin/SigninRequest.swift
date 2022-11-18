//
//  SigninRequest.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/19.
//

import Foundation

// MARK: - SigninReqeust
struct SigninRequest: Codable {
    let emailOrContact: String
    let password: String
}
