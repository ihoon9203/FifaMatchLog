//
//  Constants.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import Foundation
import UIKit

class Constants {
    static let REQUEST_OUID = "https://open.api.nexon.com/fconline/v1/id"
    static func requestForOuid(_ nickname: String) -> String {
        return "https://open.api.nexon.com/fconline/v1/id?nickname=\(nickname)"
    }
    static let API_KEY = "test_58490334e2ad6a68c35622a64cab062e211c826cd4c543d46739e5e0660bc7ec2900bb1f53050ba215b44c4ec1f165fe"
}
class ColorSets {
    static let themeColor = UIColor(named: "ThemeColor")!
    static let buttonThemeColor = UIColor(named: "ButtonThemeColor")!
}
