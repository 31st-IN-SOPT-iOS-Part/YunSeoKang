//
//  SigupRequest.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/19.
//

import Foundation

struct SignupRequest: Codable {
    let emailOrContact: String
    let password: String
    let passwordCheck: String
}
