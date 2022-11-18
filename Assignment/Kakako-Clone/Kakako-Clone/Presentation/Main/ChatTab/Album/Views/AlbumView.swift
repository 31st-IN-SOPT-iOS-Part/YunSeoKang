//
//  AlbumView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import Then
import SnapKit

class AlbumView: BaseView, UICollectionViewDelegate {
    //MARK: UIComponents
    private let naviView = UIView()
    let dismissButton = UIButton()
    private let naviTitleLabel = UILabel()
    private let sendButton = UIButton()
    private let albumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDelegate()
    }
    
    override func setUI() {
        dismissButton.do {
            $0.setImage(ImageLiterals.Album.closeButton, for: .normal)
        }
        
        naviTitleLabel.do {
            $0.textColor = .black
            $0.font = .AppleSDGothicNeoRegular(ofSize: 16)
            $0.text = "최근 항목"
        }
        
        sendButton.do {
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle("전송", for: .normal)
            $0.titleLabel?.font = .AppleSDGothicNeoRegular(ofSize: 14)
        }
    }
    
    override func setLayout() {
        addSubViews(naviView, albumCollectionView)
        
        naviView.addSubViews(dismissButton, naviTitleLabel, sendButton)
        
        dismissButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.size.equalTo(24)
        }
        
        naviTitleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        sendButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(11)
        }
        
        naviView.snp.makeConstraints{
            $0.height.equalTo(38)
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        albumCollectionView.snp.makeConstraints{
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

extension AlbumView {
    private func registerCell() {
        AlbumCollectionViewCell.register(target: albumCollectionView)
    }
    
    private func setDelegate() {
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
    }
}


extension AlbumView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (width - 20) / 3
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
}

extension AlbumView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumModelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.className, for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(AlbumModelList[indexPath.row])
        return imageCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let albumCell = collectionView.cellForItem(at: indexPath) as! AlbumCollectionViewCell
        
    }
}
