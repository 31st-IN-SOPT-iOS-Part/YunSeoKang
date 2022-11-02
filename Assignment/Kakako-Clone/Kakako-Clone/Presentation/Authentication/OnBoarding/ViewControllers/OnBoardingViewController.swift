//
//  onBoardingVC.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

final class OnBoardingViewController: BaseViewController {
    
    //MARK: Properties
    var disposeBag = DisposeBag()

    //MARK: UIComponents
    let onBoardingView = OnBoardingView()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        setLayout()
    }
}

//MARK: Extension
extension OnBoardingViewController {
    private func bindTapAction() {
//        onBoardingView.checkButton.rx.tap
//            .withUnretained(self)
//            .subscribe(onNext: { owner, _ in
//                let TabBarController = KakaotalkTabBarController()
//                if let window = self.window?.windowScene?.keyWindow {
//                    window.rootViewController = TabBarController
//                }
//            })
    }
    
    private func setAddTarget() {
        onBoardingView.checkButton.addTarget(self, action: #selector(touchCheckButton), for: .touchUpInside)
        
    }
    
    private func setLayout() {
        view.addSubview(onBoardingView)
        onBoardingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func pushToTabBar() {
        let TabBarController = KakaotalkTabBarController()
        if let window = view.window?.windowScene?.keyWindow {
            window.rootViewController = TabBarController
        }
    }

    @objc
    private func touchCheckButton() {
        pushToTabBar()
    }
}
