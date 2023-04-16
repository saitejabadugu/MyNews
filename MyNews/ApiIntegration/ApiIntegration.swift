//
//  ApiIntegration.swift
//  MyNews
//
//  Created by Keerthi Devipriya(kdp) on 16/04/23.
//

import Foundation

class Api {
    static func getNewsInfo(completion: @escaping(NewsInfoModel) -> Void) {
        let newsUrl = "https://newsapi.org/v2/everything?q=tesla&from=2023-03-16&sortBy=publishedAt&apiKey=a1d2d20d7cd947268ecfaf3b7098d5e9"
        let url = URL(string: newsUrl)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Got Errror -----\(error)")
                return
            }
            
            
            if let data = data,
               let newsData = try? JSONDecoder().decode(NewsInfoModel.self, from:  data) {
                print("newsdata----\(newsData)")
                completion(newsData)
            }
        })
        task.resume()
    }
}
