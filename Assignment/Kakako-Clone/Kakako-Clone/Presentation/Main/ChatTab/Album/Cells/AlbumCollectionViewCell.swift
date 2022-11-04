//
//  AlbumCollectionViewCell.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import SnapKit
import Then

class AlbumCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    //MARK: Properties
    static var isFromNib: Bool = false
    
    //MARK: UIComponents
    public let albumImageView = UIImageView()
    private let selectedView = UIView()
    private let selectedLabel = UILabel()
    
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

extension AlbumCollectionViewCell {
    private func setUI() {
        selectedView.do {
            $0.layer.cornerRadius = 9
            $0.backgroundColor = .kakaoDefault
            $0.isHidden = true
        }
        
        selectedLabel.do {
            $0.textColor = .black
            $0.font = .AppleSDGothicNeoRegular(ofSize: 10)
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(albumImageView, selectedView)
        selectedView.addSubview(selectedLabel)
        
        albumImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        selectedView.snp.makeConstraints{
            $0.top.trailing.equalToSuperview().inset(4)
            $0.size.equalTo(18)
        }
        
        selectedLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    public func dataBind(_ model: AlbumModel) {
        albumImageView.image = model.albumImage
    }
}
