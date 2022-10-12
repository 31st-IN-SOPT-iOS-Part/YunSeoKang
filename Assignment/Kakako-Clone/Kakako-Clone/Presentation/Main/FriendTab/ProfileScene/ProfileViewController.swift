//
//  ProfileViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/12.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    //MARK: UIComponents
    private let backgroundImageView = UIImageView()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.FriendTab.closeButton, for: .normal)
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.FriendTab.profileImage
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .AppleSDGothicNeoRegular(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let dividingLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .dividingLine
        return view
    }()
    
    private lazy var chattingWithMeStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.talkButton ?? UIImage(), "나와의 채팅")
    private lazy var editProfileStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.editButton ?? UIImage(), "프로필 편집")
    private lazy var kakaoStoryStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.storyButton ?? UIImage(), "카카오스토리")
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension ProfileViewController {
    private func setUI() {
        backgroundImageView.backgroundColor = .profileBackground
    }
    
    private func setAddTarget() {
        dismissButton.addTarget(self, action: #selector(dismissToFriendTab), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubViews(backgroundImageView, dismissButton, profileImageView,
                         nameLabel, dividingLineView, buttonStackView)
        buttonStackView.addArrangedSubviews(chattingWithMeStackView,
                                            editProfileStackView,
                                            kakaoStoryStackView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14.adjusted)
            make.leading.equalToSuperview().inset(14.adjusted)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50.adjusted)
            make.leading.trailing.equalToSuperview().inset(80.adjusted)
        }
        
        dividingLineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalTo(buttonStackView.snp.top).offset(-30)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(dividingLineView.snp.top).offset(-42)
            make.centerX.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel.snp.top).offset(-8)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(96.adjusted)
        }
        
    }
    
    private func makeStackView(_ buttonImage: UIImage, _ buttonLabel: String) -> UIStackView {
        let imageView = UIImageView()
        imageView.image = buttonImage
        imageView.tintColor = .white
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24.adjusted)
        }
        
        let label = UILabel()
        label.font = .AppleSDGothicNeoRegular(ofSize: 10)
        label.text = buttonLabel
        label.textColor = .white
        
        let stackView = UIStackView()
        stackView.addArrangedSubviews(imageView, label)
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }
    
    private func touchDismissButton() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func dismissToFriendTab() {
        touchDismissButton()
    }
}