//
//  UserService.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/19.
//

import Foundation
import Moya

enum UserService {
    case signup(param: SignupRequest)
    case signin(param: SigninRequest)
}

extension UserService: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signup(param: _):
            return URLConstant.signup
        case .signin(param: _):
            return URLConstant.signin
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup, .signin:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signup(let param):
            return .requestJSONEncodable(param)
        case .signin(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signin, .signup:
            return NetworkConstant.noTokenHeader
        }
    }
    
    
}
