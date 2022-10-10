//
//  MelonViewController.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/10.
//

import UIKit

final class MelonViewController: UIViewController {
    
    //MARK: UIComponents
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        return scrollView
    }()
    
    private let todayTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 18:00 기준"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "멜론 TOP 100"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let fullListButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        return button
    }()
    
    private let nowButton: UIButton = {
        let button = UIButton()
        button.setTitle("NOW", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = UIColor(red: 86.0/256.0, green: 188.0/256.0, blue: 78.0/256.0, alpha: 1.0)
        button.layer.cornerRadius = 14
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let musicListView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "목요일은 트랙제로, 전문가 추천 음악"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgDJ")
        return imageView
    }()
    
    private let underBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 86.0/256.0, green: 188.0/256.0, blue: 78.0/256.0, alpha: 1.0)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let musicListImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_menu")
        return imageView
    }()
    
    private let musicTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blueming"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let singer: UILabel = {
        let label = UILabel()
        label.text = "아이유"
        label.textColor = .black
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    
    private let nextMusicButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_next"), for: .normal)

        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_play"), for: .normal)
        return button
    }()
    
    private let previousPlayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_back"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}


extension MelonViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(scrollView, underBarView)
        underBarView.addSubviews(musicListImage, musicTitleLabel, singer,
                                 nextMusicButton, playButton, previousPlayButton)
        scrollView.addSubviews(todayTimeLabel, topLabel, fullListButton,
                               nowButton, musicListView, subTitleLabel, imageView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        todayTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(todayTimeLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(20)
        }
        
        fullListButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(27)
        }
        
        nowButton.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(72.adjusted)
            make.height.equalTo(32.adjusted)
        }
        
        musicListView.snp.makeConstraints { make in
            make.top.equalTo(nowButton.snp.bottom).offset(15)
            make.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(335.adjusted)
            make.height.equalTo(400.adjusted)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(musicListView.snp.bottom).offset(49)
            make.leading.equalToSuperview().inset(15)
        }
        
        imageView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(21)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        underBarView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(73.adjusted)
        }
        
        musicListImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(28.adjusted)
        }
        
        musicTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(9)
            make.leading.equalTo(musicListImage.snp.trailing).offset(8)
        }
        
        singer.snp.makeConstraints { make in
            make.top.equalTo(musicTitleLabel.snp.bottom).offset(1)
            make.leading.equalTo(musicListImage.snp.trailing).offset(9)
        }
        
        nextMusicButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(14)
            make.width.height.equalTo(24)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalTo(nextMusicButton.snp.leading).offset(-8)
            make.width.height.equalTo(31)
        }
        
        previousPlayButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.width.height.equalTo(24)
            make.trailing.equalTo(playButton.snp.leading).offset(-8)
        }
    }
}
