//
//  NewUserDelegate.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import Foundation

protocol HomeViewDelegate: NSObject {
    func didLoadOuid(_ ouid: String)
    func didFailWithError(_ error: NetworkError)
}
