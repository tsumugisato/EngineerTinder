//
//  File.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/02.
//
import Foundation

struct UserProfile: Codable {

    let id: Int
    let name: String
    let email: String?
    let avatarUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case avatarUrl = "avatar_url"
    }
}

//  Repository.swift
// ユーザーのリポジトリ情報
struct Repository: Codable {

    let id: Int
    let name: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case url = "html_url"
    }
}
