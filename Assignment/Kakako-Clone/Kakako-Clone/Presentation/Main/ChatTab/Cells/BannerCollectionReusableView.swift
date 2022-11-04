//
//  BannerCollectionReusableView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import Then
import SnapKit

class BannerCollectionReusableView: UICollectionReusableView {
    //MARK: Properties
    static let identifier = "BannerCollectionReusableView"
    
    private let bannerImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerCollectionReusableView {
    private func setUI() {
        bannerImage.do {
            $0.image = ImageLiterals.ChatTab.banner
            $0.layer.cornerRadius = 6
        }
    }
    
    private func setLayout() {
        addSubview(bannerImage)
        bannerImage.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalToSuperview()
        }
    }
}
