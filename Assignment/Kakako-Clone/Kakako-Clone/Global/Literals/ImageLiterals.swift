//
//  ImageLiterals.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

struct ImageLiterals {
    
    struct TabBar {
        static let friendTab = UIImage(named: "friendTabIcon")
        static let talkTab = UIImage(named: "messageTabIcon")
        static let searchTab = UIImage(named: "searchTabIcon")
        static let shopTab = UIImage(named: "shopTabIcon")
        static let settingTab = UIImage(named: "detailTabIcon")
        
        static let friendTabSelected = UIImage(named: "friendTabIcon_selected")
        static let talkTabSelected = UIImage(named: "messageTabIcon_selected")
        static let searchTabSelected = UIImage(named: "searchTabIcon_selected")
        static let shopTabSelected = UIImage(named: "shopTabIcon_selected")
        static let settingTabSelected = UIImage(named: "detailTabIcon_selected")
    }
    
    struct FriendTab {
        static let profileImage = UIImage(named: "profileImage")
        static let settingButton = UIImage(named: "settingsButton")
        static let closeButton = UIImage(named: "profileCloseBtn")
        static let editButton = UIImage(named: "profileEditImg")
        static let storyButton = UIImage(named: "profileStoryImg")
        static let talkButton = UIImage(named: "profileTalkImg")
    }
}
