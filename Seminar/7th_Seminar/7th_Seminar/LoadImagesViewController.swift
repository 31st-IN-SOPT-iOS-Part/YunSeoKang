//
//  LoadImagesViewController.swift
//  7th_Seminar
//
//  Created by 강윤서 on 2022/11/26.
//

import Foundation
import UIKit

import SnapKit
import Then

// MARK: - LoadImagesViewController

final class LoadImagesViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView()
    
    // MARK: - Variables
    
    var timeTrigger: Bool = true
    var realTime = Timer()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        startAction()
    }
}

// MARK: - Extensions

extension LoadImagesViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(300)
        }
    }
    
    // MARK: - General Helpers
    
    private func startAction() {
        if timeTrigger {
            checkTimeTrigger()
        }
    }
    
    private func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 0.01, target: self,
                                        selector: #selector(start), userInfo: nil, repeats: true)
        timeTrigger = false
    }
    
    private func urlToData(url: URL) -> Data {
        return try! Data(contentsOf: url)
    }
    
    private func dataToImage(data: Data) -> UIImage {
        guard let image = UIImage(data: data) else { return UIImage() }
        return image
    }
    
    private func setImage(image: UIImage) {
        imageView.image = image
    }

    private func fetchImages() {
        let url = URL(string: "https://picsum.photos/3840/2160/?random")!
        DispatchQueue.global().async {
            let data = self.urlToData(url: url)
            let image = self.dataToImage(data: data)
            DispatchQueue.main.async {
                self.setImage(image: image)
            }
        }
    }
    
    
    // MARK: - Objc Helpers
    
    @objc
    private func start() {
        self.fetchImages()
    }
}
