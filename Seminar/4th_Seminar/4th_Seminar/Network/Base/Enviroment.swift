//
//  Enviroment.swift
//  4th_Seminar
//
//  Created by 강윤서 on 2022/11/05.
//

import Foundation

// MARK: - Environment
struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
