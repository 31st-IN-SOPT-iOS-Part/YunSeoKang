//
//  UserModel.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/02.
//

import UIKit

struct UserModel {
    var userName: String
    var profileImage: UIImage?
    var statusMessage: String?
}

var userList: [UserModel] = [
    UserModel(userName: "김솝트",
              profileImage: ImageLiterals.FriendTab.profileImage1,
              statusMessage: "언제 볼건데??"),
    UserModel(userName: "이솝트",
              profileImage: ImageLiterals.FriendTab.profileImage2,
              statusMessage: "피곤해요"),
    UserModel(userName: "강솝트",
              profileImage: ImageLiterals.FriendTab.profileImage3,
              statusMessage: "살려줘요"),
    UserModel(userName: "최솝트",
              profileImage: ImageLiterals.FriendTab.profileImage4,
              statusMessage: "과제 하는 중"),
    UserModel(userName: "박솝트",
              profileImage: ImageLiterals.FriendTab.profileImage5,
              statusMessage: "월요일"),
    UserModel(userName: "노솝트",
              profileImage: ImageLiterals.FriendTab.profileImage6,
              statusMessage: nil),
    UserModel(userName: "정솝트",
              profileImage: ImageLiterals.FriendTab.profileImage7,
              statusMessage: "토요일은 솝트 세미나"),
    UserModel(userName: "안솝트",
              profileImage: ImageLiterals.FriendTab.profileImage8,
              statusMessage: "뒷풀이 가세요?"),
    UserModel(userName: "황솝트",
              profileImage: ImageLiterals.FriendTab.profileImage9,
              statusMessage: "안녕"),
    UserModel(userName: "고솝트",
              profileImage: ImageLiterals.FriendTab.profileImage1,
              statusMessage: nil),
    UserModel(userName: "장솝트",
              profileImage: ImageLiterals.FriendTab.profileImage2,
              statusMessage: "상태메세지"),
    UserModel(userName: "류솝트",
              profileImage: ImageLiterals.FriendTab.profileImage3,
              statusMessage: "더미데이터"),
    UserModel(userName: "원솝트",
              profileImage: ImageLiterals.FriendTab.profileImage4,
              statusMessage: nil),
    UserModel(userName: "양솝트",
              profileImage: ImageLiterals.FriendTab.profileImage5,
              statusMessage: "아요 좋아"),
    UserModel(userName: "나솝트",
              profileImage: ImageLiterals.FriendTab.profileImage6,
              statusMessage: "아미녀 할래 ㅋㅋ")
]
