//
//  BaseViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension BaseViewController {
    func setUI() {
        view.backgroundColor = .white
    }
}
