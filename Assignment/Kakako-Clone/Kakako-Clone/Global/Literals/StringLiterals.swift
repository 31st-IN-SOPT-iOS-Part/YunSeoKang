//
//  StringLiterals.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import Foundation

struct I18N {
    
    struct Auth {
        static let startKakao = "카카오톡을 시작합니다"
        static let loginDescription =
"""
사용하던 카카오 계정이 있다면
이메일 또는 전화번호로 로그인해 주세요.
"""
        static let emailOrPhone = "이메일 또는 전화번호"
        static let password = "비밀번호"
        static let loginKakao = "카카오계정 로그인"
        static let newAccount = "새로운 카카오계정 만들기"
        static let findAccount = "카카오계정 또는 비밀번호 찾기"
        static let checkPassword = "비밀번호 확인"
        static let checkButton = "확인"
    }
    
    struct FriendTab {
        static let topBarTitle = "친구"
    }
    
    struct Profile {
        static let chattingWithMe = "나와의 채팅"
        static let editProfile = "프로필 편집"
        static let kakaoStory = "카카오스토리"
    }
    
    struct ChatTab {
        static let chatTitle = "채팅"
        static let opentChatTitle = "오픈채팅"
    }
}
