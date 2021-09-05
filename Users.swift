//
//  Users.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/05.
//

import Foundation

class User {
    
    var email: String
    var name: String
    var age: String
    var residence: String
    var language1:String
    var howlong1:String
    var language2:String
    let howlong2:String
    var language3:String
    var howlong3:String
    var introduction: String
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.age = dic["age"] as? String ?? ""
        self.residence = dic["residence"] as? String ?? ""
        self.language1 = dic["language1"] as? String ?? ""
        self.howlong1 = dic["howlong1"] as? String ?? ""
        self.language2 = dic["language2"] as? String ?? ""
        self.howlong2 = dic["howlong2"] as? String ?? ""
        self.language3 = dic["language3"] as? String ?? ""
        self.howlong3 = dic["howlong3"] as? String ?? ""
        self.introduction = dic["introduction"] as? String ?? ""
    }
}
