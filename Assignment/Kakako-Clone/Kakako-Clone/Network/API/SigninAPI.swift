//
//  SigninAPI.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/19.
//

import Foundation
import Moya

final class SigninAPI {
    static let shared: SigninAPI = SigninAPI()
    private let signinProvider = MoyaProvider<UserService>(plugins: [NetworkLoggerPlugin()])
    private init() { }

    public private(set) var signinResponse: GeneralResponse<SigninResponse>?
    public private(set) var signinRequest: SigninRequest?

    // MARK: - Signup
    
    func signin(param: SigninRequest, completion: @escaping ((SigninResponse?, Error?) -> ())) {
        signinProvider.request(.signin(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.signinResponse = try result.map(GeneralResponse<SigninResponse>.self)
                    guard let signindata = self?.signinResponse?.data else {
                        completion(nil, Error.self as? Error)
                        return
                    }
                    completion(signindata, nil)
                } catch(let err) {
                    print(err.localizedDescription)
                    completion(nil, err)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil, err)
            }
        }
    }
}
