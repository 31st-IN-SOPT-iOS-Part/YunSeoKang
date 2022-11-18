//
//  FriendViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then


final class FriendViewController: BaseViewController {
    
    //MARK: Properties
    var disposBag = DisposeBag()
    
    //MARK: UIComponents
    private let friendTabView = FriendTabView()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        bindTapAction()
    }
}

extension FriendViewController {
    private func bindTapAction() {
        friendTabView.profileButton.rx.tap
            .withUnretained(self)
            .subscribe { owner, _ in
                let profileVC = ProfileViewController()
                profileVC.modalPresentationStyle = .overFullScreen
                owner.present(profileVC, animated: true)}
            .disposed(by: disposBag)
    }

    private func setLayout() {
        view.addSubview(friendTabView)
        friendTabView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
