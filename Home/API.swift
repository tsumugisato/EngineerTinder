//
//  API.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//
//
//import Foundation
//
//enum GitHub {
//    case profile(name: String)
//    case repository(name: String, type: String)
//}
//
//extension GitHub: TargetType {
//    var baseURL: URL { return URL(string: "https://api.github.com")! }
//
//    var path: String {
//
//        switch self {
//        case let .profile(name):
//            return "/users/\((name))"
//        case let.repository(name, _):
//            return "/users/\(name)/repos"
//        }
//    }
//
//    var method: Moya.Method { return .get }
//    var sampleData: Data {
//        var path = ""
//        switch self {
//        case .profile:
//            path = Bundle.main.path(forResource: "profile", ofType: "json")!
//        case .repository:
//            path = Bundle.main.path(forResource: "repository", ofType: "json")!
//        }
//        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
//    }
//
//    var task: Task {
//        switch self {
//        case .profile:
//            return .requestPlain
//        case let .repository(_, type):
//            return .requestParameters(parameters: ["type" : type], encoding: URLEncoding.default)
//        }
//    }
//
//    var headers: [String : String]? { return ["Content-Type": "application/json"] }
//}
