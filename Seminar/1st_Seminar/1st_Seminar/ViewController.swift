//
//  ViewController.swift
//  1st_Seminar
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: UIComponents
    private let testLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1차 세미나🍏"
        return lb
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

//MARK: Extension
extension ViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(testLabel)
        
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

