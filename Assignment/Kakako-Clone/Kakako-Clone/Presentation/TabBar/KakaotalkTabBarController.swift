//
//  KakaotalkTabBarController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

class KakaotalkTabBarController: UITabBarController {

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}

extension KakaotalkTabBarController {
    private func makeTabBar(viewController: UIViewController,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.tabBarItem = UITabBarItem(title: "",
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    private func setTabBar() {
        let friendTab = makeTabBar(viewController: FriendViewController(),
                                   tabBarImg: ImageLiterals.TabBar.friendTab ?? UIImage(),
                                   tabBarSelectedImg: ImageLiterals.TabBar.friendTabSelected ?? UIImage(),
                                   renderingMode: .alwaysTemplate)
        let talkTab = makeTabBar(viewController: TalkViewController(),
                                 tabBarImg: ImageLiterals.TabBar.talkTab ?? UIImage(),
                                 tabBarSelectedImg: ImageLiterals.TabBar.talkTabSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        let viewTab = makeTabBar(viewController: ViewViewController(),
                                 tabBarImg: ImageLiterals.TabBar.viewTab ?? UIImage(),
                                 tabBarSelectedImg: ImageLiterals.TabBar.viewTabSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        let shopTab = makeTabBar(viewController: ShopViewController(),
                                 tabBarImg: ImageLiterals.TabBar.shopTab ?? UIImage(),
                                 tabBarSelectedImg: ImageLiterals.TabBar.shopTabSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        let settingTab = makeTabBar(viewController: SettingViewController(),
                                    tabBarImg: ImageLiterals.TabBar.settingTab ?? UIImage(),
                                    tabBarSelectedImg: ImageLiterals.TabBar.settingTabSelected ?? UIImage(),
                                    renderingMode: .alwaysTemplate)
        
        let tabs = [friendTab, talkTab, viewTab, shopTab, settingTab]
        
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
}
