//
//  ImageLiterals.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

struct ImageLiterals {
    
    struct TabBar {
        static let friendTab = UIImage(systemName: "person")
        static let talkTab = UIImage(systemName: "message")
        static let viewTab = UIImage(systemName: "eye")
        static let shopTab = UIImage(systemName: "bag")
        static let settingTab = UIImage(systemName: "ellipsis.circle")
        
        static let friendTabSelected = UIImage(systemName: "person.fill")
        static let talkTabSelected = UIImage(systemName: "message.fill")
        static let viewTabSelected = UIImage(systemName: "eye.fill")
        static let shopTabSelected = UIImage(systemName: "bag.fill")
        static let settingTabSelected = UIImage(systemName: "ellipsis.circle.fill")
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
