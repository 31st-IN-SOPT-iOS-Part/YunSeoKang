//
//  ThirdViewController.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/10.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: Properties
    var width = Int(UIScreen.main.bounds.width - 144)
    
    //MARK: UIComponents
    private let viewOne = UIView()
    private let viewTwo = UIView()
    private let viewThree = UIView()
    private let viewFour = UIView()
    private let viewFive = UIView()
    private let viewCover = UIView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }()
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()

    }
}

extension ThirdViewController {
    private func setUI() {
        view.backgroundColor = .white
        stackView.backgroundColor = .white
        viewCover.backgroundColor = .white
        viewOne.backgroundColor = .systemGray
        viewTwo.backgroundColor = .systemGray
        viewThree.backgroundColor = .systemGray
        viewFour.backgroundColor = .systemGray
        viewFive.backgroundColor = .systemGray
    }
    
    private func setLayout() {
        view.addSubviews(stackView)
        stackView.addArrangedSubviews(viewOne, viewCover)
        viewCover.addSubviews(viewTwo, viewThree, viewFour, viewFive)
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(width.adjusted)
            make.height.equalTo(330.adjusted)
        }
        
        viewOne.snp.makeConstraints { make in
            make.top.directionalHorizontalEdges.width.equalToSuperview()
            make.height.equalTo(154.adjusted)
        }
        
        viewCover.snp.makeConstraints { make in
            make.directionalHorizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(viewOne.snp.bottom).offset(24)
        }
        
        viewTwo.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(stackView.snp.centerX).offset(-2)
            make.height.equalTo(154.adjusted)
        }
        
        viewThree.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(stackView.snp.centerX).offset(2)
            make.height.equalTo(33.adjusted)
        }
        
        viewFour.snp.makeConstraints { make in
            make.top.equalTo(viewThree.snp.bottom).offset(4.adjusted)
            make.trailing.equalToSuperview()
            make.leading.equalTo(stackView.snp.centerX).offset(2)
            make.height.equalTo(33.adjusted)
        }
        
        viewFive.snp.makeConstraints { make in
            make.top.equalTo(viewFour.snp.bottom).offset(4.adjusted)
            make.bottom.trailing.equalToSuperview()
            make.leading.equalTo(stackView.snp.centerX).offset(2)
        }
    }
}
