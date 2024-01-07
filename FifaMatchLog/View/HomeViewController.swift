//
//  ViewController.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    let userTable: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 10
        table.layer.borderWidth = 1
        table.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        table.register(AddUserTableViewCell.self, forCellReuseIdentifier: "AddUserCell")
        table.backgroundColor = ColorSets.themeColor
        table.layer.borderColor = UIColor.white.cgColor
        return table
    }()
    
    var numberOfUser: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSets.themeColor
        userTable.delegate = self
        userTable.dataSource = self
        if let users = UserDefaults.standard.dictionary(forKey: "user") {
            numberOfUser = users.count
        } else {
            
        }
        placeLayout()
    }
    func placeLayout() {
        view.addSubview(userTable)
        userTable.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(numberOfUser * 40 + 40)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfUser + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == numberOfUser {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddUserCell", for: indexPath) as! AddUserTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == numberOfUser {
            navigationController?.pushViewController(CreateNewUserViewController(), animated: true)
        }
    }
}
