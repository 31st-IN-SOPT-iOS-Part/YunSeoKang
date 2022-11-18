//
//  GeneralResponse.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/19.
//

import Foundation

struct GeneralResponse<T: Decodable>: Decodable {
    var statusCode: Int
    var success: Bool
    var message: String
    var data: T?

    enum CodingKeys: String, CodingKey {
        case statusCode
        case success
        case message
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
        
        
    }
}
