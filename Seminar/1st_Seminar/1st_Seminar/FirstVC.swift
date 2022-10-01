//
//  FirstVC.swift
//  1st_Seminar
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

class FirstVC: UIViewController {
    
    //MARK: UIComponents
    private let yourChoiceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "민초 vs 반민초 당신의 선택은?"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    private let answerTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray4
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 18, weight: .medium)
        return tf
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음으로", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        return btn
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setUI()
    }
}

//MARK: Extension
extension FirstVC {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(yourChoiceLabel, answerTextField, nextButton)
        
        yourChoiceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
        }
        
        answerTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(yourChoiceLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(80)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(answerTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(80)
        }
    }
    
    private func presentToSecondVC() {
        let secondVC = SecondVC()
        secondVC.modalPresentationStyle = .formSheet
        if let answer = answerTextField.text {
            secondVC.dataBind(result: answer)
        }
        self.present(secondVC, animated: true)
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondVC()
        if let answer = answerTextField.text {
            secondVC.dataBind(result: answer)
        }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchUpInside() {
        //presentToSecondVC()
        pushToSecondVC()
    }
}
