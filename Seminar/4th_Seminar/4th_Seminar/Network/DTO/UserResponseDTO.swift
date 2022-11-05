//
//  UserResponseDTO.swift
//  4th_Seminar
//
//  Created by 강윤서 on 2022/11/05.
//

import Foundation

// MARK: - LoginResponseDto
struct LoginResponseDto: Codable {
    let status: Int
    let message: String
    let result: Results?
}

/// Moya의 Result와 충돌이 나기 때문에 뒤에 s 하나만 붙여주세요!
// MARK: - Results
struct Results: Codable {
    let id: Int
    let name: String
    let profileImage, bio: String?
    let email, password: String
}
