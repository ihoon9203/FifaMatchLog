//
//  NewUserViewModel.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import Foundation

class NewUserViewModel {
    let userDataParser = UserDataParser()
    weak var delegate: HomeViewDelegate?
    // get carousel banners
    func getUserOuid(_ nickname: String) {
        let ouidAPIURL = Constants.requestForOuid(nickname)
        if let url = URL(string: ouidAPIURL) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue(Constants.API_KEY, forHTTPHeaderField: "x-nxopen-api-key")
            self.userDataParser.parseRequestForOuid(request: request) { ouid in
                self.delegate?.didLoadOuid(ouid)
            } onFailure: { error in
                self.delegate?.didFailWithError(error)
            }

        }

    }
}
