//
//  UserRouter.swift
//  4th_Seminar
//
//  Created by 강윤서 on 2022/11/05.
//

import UIKit

import Moya

enum UserRouter {
    case signup(param: SignupRequestDto)
    case login(param: LoginRequestDto)
}

extension UserRouter: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signup(param: _):
            return "/user/signup"
        case .login(param: _):
            return "/user/signin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup(param: _):
            return .post
        case .login(param: _):
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signup(param: let param):
//            return .requestJSONEncodable(param)
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
            
        case .login(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
