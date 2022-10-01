//
//  SecondVC.swift
//  1st_Seminar
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: Properties
    var result: String?
    
    //MARK: UIComponents
    private let resultLabel: UILabel = {
        let lb = UILabel()
        lb.text = "당신의 선택은 이거였군요!"
        lb.font = .systemFont(ofSize: 24, weight: .bold)
        return lb
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("뒤로가기", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        btn.addTarget(self, action: #selector(touchBackButton), for: .touchUpInside)
        return btn
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setUI()
    }
}


//MARK: Extension
extension SecondVC {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(resultLabel, backButton)
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resultLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(80)
        }
    }
    
    @objc
    private func touchBackButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func dataBind(result: String) {
        resultLabel.text = "당신의 선택은 \(result)였군요!"
    }
}
