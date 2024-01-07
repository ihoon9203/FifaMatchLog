//
//  CreateNewUserViewController.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import UIKit

class CreateNewUserViewController: UIViewController {
    
    let newUserViewModel = NewUserViewModel()
    
    let textField: InsetedTextField = {
        let textField = InsetedTextField()
        textField.placeholder = "닉네임"
        textField.textColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.white.cgColor
        textField.backgroundColor = ColorSets.themeColor
        textField.textInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return textField
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorSets.buttonThemeColor
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("추가", for: .normal)
        button.addTarget(self, action: #selector(onConfirmButtonClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSets.themeColor
        newUserViewModel.delegate = self
        placeLayout()
    }
    
    let errorTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "존재하지 않는 닉네임 입니다."
        label.alpha = 0
        return label
    }()
    func placeLayout() {
        view.addSubview(textField)
        view.addSubview(confirmButton)
        view.addSubview(errorTextLabel)
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(40)
        }
        confirmButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(40)
            make.top.equalTo(textField.snp.bottom).offset(10)
        }
        errorTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(textField)
            make.top.equalTo(confirmButton.snp.bottom).offset(10)
        }
    }
    
    /**
        * 1.  nickname exists in UserDefault
        * 2.  nickname not found as response
        * 3.  internet connection error
        * 4.  textField is empty
     */
    @objc func onConfirmButtonClick() {
        guard let nickname = textField.text else {
            errorTextLabel.alpha = 1
            errorTextLabel.text = "닉네임을 입력해주세요."
            return
        }
        if nickname == "" {
            errorTextLabel.alpha = 1
            errorTextLabel.text = "닉네임을 입력해주세요."
            return
        }
        newUserViewModel.getUserOuid(nickname.convertKoreanToHex())
    }
}
extension CreateNewUserViewController: HomeViewDelegate {
    func didFailWithError(_ error: NetworkError) {
        print(error)
    }
    
    func didLoadOuid(_ ouid: String) {
        print(ouid)
    }
}
