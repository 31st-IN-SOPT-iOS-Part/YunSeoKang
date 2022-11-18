//
//  ProfileViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class ProfileViewController: UIViewController {
    
    //MARK: Properties
    var profileViewTranslation = CGPoint(x: 0, y: 0)
    var profileViewVelocity = CGPoint(x: 0, y: 0)
    
    //MARK: UIComponents
    private let backgroundImageView = UIImageView()
    private let dismissButton = UIButton()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let dividingLineView = UIView()
    private lazy var chattingWithMeStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.talkButton ?? UIImage(), "나와의 채팅")
    private lazy var editProfileStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.editButton ?? UIImage(), "프로필 편집")
    private lazy var kakaoStoryStackView: UIStackView = makeStackView(ImageLiterals.FriendTab.storyButton ?? UIImage(), "카카오스토리")
    private lazy var buttonStackView = UIStackView()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
        setGesture()
    }
}

extension ProfileViewController {
    private func setUI() {
        backgroundImageView.backgroundColor = .profileBackground
        
        dismissButton.do {
            $0.setImage(ImageLiterals.FriendTab.closeButton, for: .normal)
        }
        
        profileImageView.do {
            $0.image = ImageLiterals.FriendTab.profileImage
        }
        
        nameLabel.do {
            $0.text = "김솝트"
            $0.font = .AppleSDGothicNeoRegular(ofSize: 18)
            $0.textColor = .white
        }
        
        dividingLineView.do {
            $0.backgroundColor = .dividingLine
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
    }
    
    private func setAddTarget() {
        dismissButton.addTarget(self, action: #selector(dismissToFriendTab), for: .touchUpInside)
    }
    
    private func setGesture() {
        let chatButtonGestrue = UITapGestureRecognizer(target: self, action: #selector(didTapStackView))
        let editProfileButtonGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStackView))
        let kakaoStoryButtonGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStackView))
        
        chattingWithMeStackView.addGestureRecognizer(chatButtonGestrue)
        editProfileStackView.addGestureRecognizer(editProfileButtonGesture)
        kakaoStoryStackView.addGestureRecognizer(kakaoStoryButtonGesture)
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(moveProfileViewWithGesture)))
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
            make.top.equalToSuperview().inset(58.adjusted)
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
    
    //MARK: objc functions
    @objc
    private func dismissToFriendTab() {
        touchDismissButton()
    }
    
    @objc
    private func didTapStackView(_ sender: UITapGestureRecognizer) {
        print("버튼을 눌렀습니다", sender)
    }
    
    @objc
    private func moveProfileViewWithGesture(_ sender: UIPanGestureRecognizer) {
        profileViewTranslation = sender.translation(in: view)
        profileViewVelocity = sender.velocity(in: view)
        
        switch sender.state {
        case .changed:
            if profileViewTranslation.y > 0 {
                UIView.animate(withDuration: 0.1) {
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.profileViewTranslation.y)
                }
            }
        case .ended:
            if profileViewTranslation.y < 400 {
                UIView.animate(withDuration: 0.1) {
                    self.view.transform = .identity
                }
            } else {
                dismiss(animated: true)
            }
        default:
            break
        }
    }
}
