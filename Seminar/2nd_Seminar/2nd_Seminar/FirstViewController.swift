//
//  ViewController.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/08.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    //MARK: UI Components
    private let viewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private let viewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }


}

extension FirstViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(viewOne, viewTwo)
        
        viewOne.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(275)
            make.directionalHorizontalEdges.equalToSuperview().inset(62)
            make.width.equalTo(273)
            make.height.equalTo(155)
        }
        
        viewTwo.snp.makeConstraints { make in
            make.top.equalTo(viewOne.snp.bottom).offset(96)
            make.leading.equalToSuperview().inset(62)
            make.width.equalTo(109)
            make.height.equalTo(106)
        }
    }
}

