//
//  File.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/02.
//
import Foundation

struct UserProfile: Codable {

    let name: String
    let email: String?
    let password:Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case password
    }
}

//  Repository.swift
// ユーザーのリポジトリ情報
struct Repository: Codable {

    let email:String
    let name: String
    let password:String
    
    private enum CodingKeys: String, CodingKey {
        case email
        case name
        case password
    }
}
