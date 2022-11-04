//
//  TalkView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/02.
//

import UIKit

import SnapKit
import Then

class ChatTabView: BaseView {
    //MARK: UIComponents
    private let naviView = UIView()
    private let chatButton = UIButton()
    private let opentChatButton = UIButton()
    public let plusButton = UIButton()
    private let settingButton = UIButton()
    private let chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    private let bannerImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDelegate()
    }
    
    override func setUI() {
        [chatButton, opentChatButton].forEach {
            $0.setTitleColor(.black, for: .selected)
            $0.setTitleColor(.kakaoGray, for: .normal)
            $0.titleLabel?.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        chatButton.do {
            $0.setTitle(I18N.ChatTab.chatTitle, for: .normal)
        }
        
        opentChatButton.do {
            $0.setTitle(I18N.ChatTab.opentChatTitle, for: .normal)
        }
        
        settingButton.do {
            $0.setImage(ImageLiterals.FriendTab.settingButton, for: .normal)
        }
        
        plusButton.do {
            $0.setImage(ImageLiterals.ChatTab.plusButton, for: .normal)
        }
        
        bannerImage.do {
            $0.image = ImageLiterals.ChatTab.banner
        }
    }
    
    override func setLayout() {
        addSubViews(naviView, chatCollectionView)
        naviView.addSubViews(chatButton, opentChatButton, plusButton, settingButton)
        
        naviView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(width * (52/width))
        }
        
        chatButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        opentChatButton.snp.makeConstraints{
            $0.leading.equalTo(chatButton.snp.trailing).offset(7)
            $0.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints{
            $0.trailing.equalTo(settingButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }

        chatCollectionView.snp.makeConstraints{
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

extension ChatTabView {
    private func registerCell() {
        ChatCollectionViewCell.register(target: chatCollectionView)
        chatCollectionView.register(BannerCollectionReusableView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BannerCollectionReusableView.identifier)
        
    }
    
    private func setDelegate() {
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
    }
}

extension ChatTabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = width
        let cellHeight = width * (50/width)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
}

extension ChatTabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatModelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.className, for: indexPath) as? ChatCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(chatModelList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BannerCollectionReusableView", for: indexPath)
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerWidth = width
        let headerHeight = width * (72/width)
        return CGSize(width: headerWidth, height: headerHeight)
    }
}
