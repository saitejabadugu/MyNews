//
//  NewsInfoModel.swift
//  MyNews
//
//  Created by Keerthi Devipriya(kdp) on 16/04/23.
//

import Foundation

struct Source: Codable {
    let name: String
}

struct NewsInfo: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let publishedAt: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    //let strContent: String
    
}

struct NewsInfoModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsInfo]
}

