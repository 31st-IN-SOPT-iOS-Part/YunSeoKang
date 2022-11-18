//
//  AlbumViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class AlbumViewController: BaseViewController {
    //MARK: Properties
    var disposeBag = DisposeBag()

    //MARK: UIComponents
    private let albumView = AlbumView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        bindActionTap()
    }
}

extension AlbumViewController {
    private func setLayout() {
        view.addSubViews(albumView)
        albumView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func bindActionTap() {
        albumView.dismissButton.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
}
