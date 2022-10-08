import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    // MARK: - Lazy Components
    
    private lazy var scrollView = UIScrollView()
    
    // MARK: - UI Components
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
}

// MARK: - Extensions

extension SecondViewController {
    private func setUI() {
        firstView.backgroundColor = .systemGray3
        secondView.backgroundColor = .systemRed
        thirdView.backgroundColor = .systemPink
    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubviews(firstView, secondView, thirdView)
    
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.bottom).offset(45)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(self.secondView.snp.bottom).offset(45)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
            make.bottom.equalToSuperview().offset(-45)
        }
    }
}
