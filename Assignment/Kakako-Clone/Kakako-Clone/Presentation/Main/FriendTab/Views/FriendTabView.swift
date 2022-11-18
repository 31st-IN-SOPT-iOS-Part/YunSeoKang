//
//  FriendTabView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit
import SnapKit
import Then

class FriendTabView: BaseView {
    
    //MARK: UIComponents
    private let naviView = UIView()
    private let friendLabel = UILabel()
    private let settingButton = UIButton()
    let profileButton = UIButton()
    private let friendTableView = UITableView()
    private let profileTableViewHeader = profileHeaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDelegate()
    }
    
    override func setUI() {
        friendLabel.do {
            $0.text = I18N.FriendTab.topBarTitle
            $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        settingButton.do {
            $0.setImage(ImageLiterals.FriendTab.settingButton, for: .normal)
        }
        
        friendTableView.do {
            $0.separatorStyle = .none
            $0.tableHeaderView = profileTableViewHeader
            $0.tableHeaderView?.frame.size.height = width * (75/width)
        }
    }

    
    override func setLayout() {
        addSubViews(naviView, friendTableView)
        naviView.addSubViews(friendLabel, settingButton)
        
        naviView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(width * (52/width))
        }
        
        friendLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
        friendTableView.snp.makeConstraints { make in
            make.top.equalTo(naviView.snp.bottom).offset(7)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerCell() {
        FriendTableViewCell.register(target: friendTableView)
    }
    
    private func setDelegate() {
        friendTableView.delegate = self
        friendTableView.dataSource = self
    }
}

extension FriendTabView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive,
                                        title: "삭제",
                                        handler: { action, view, completionHandler in
            userList.remove(at: indexPath.row)
            self.friendTableView.reloadData()
            completionHandler(true)
        })
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

extension FriendTabView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.className, for: indexPath) as? FriendTableViewCell else {return UITableViewCell() }
        cell.dataBind(userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return width * (50 / width)
    }
}
