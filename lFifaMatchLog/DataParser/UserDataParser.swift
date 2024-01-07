//
//  UserDataParser.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import Foundation

class UserDataParser {
    
    func parseRequestForOuid(request: URLRequest, onSuccess: @escaping (String)->(), onFailure: @escaping (NetworkError) -> ()) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode > 499 {
                        onFailure(._500)
                        return
                    } else if httpResponse.statusCode == 404 {
                        onFailure(._404)
                    } else if httpResponse.statusCode > 399 {
                        onFailure(._400)
                        return
                    } else if httpResponse.statusCode > 299 {
                        onFailure(._300)
                        return
                    } else if httpResponse.statusCode < 200 {
                        onFailure(._100)
                        return
                    }
                }
                if let data = data {
                    let ouidModel = try JSONDecoder().decode(OuidModel.self, from: data)
                    onSuccess(ouidModel.ouid)
                }
            } catch {
                onFailure(._0)
            }
        }
        task.resume()
    }
}
