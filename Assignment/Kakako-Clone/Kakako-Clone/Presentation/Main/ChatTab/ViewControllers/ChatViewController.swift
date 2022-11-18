//
//  TalkViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ChatViewController: BaseViewController {
    //MARK: Properties
    var disposeBag = DisposeBag()
    
    //MARK: UIComponents
    private let chatTabView = ChatTabView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        bindTapAction()
    }
}

extension ChatViewController {
    private func setLayout() {
        view.addSubview(chatTabView)
        chatTabView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func bindTapAction() {
        chatTabView.plusButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                let nextVC = AlbumViewController()
                nextVC.modalPresentationStyle = .overFullScreen
                owner.present(nextVC, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
}
