//
//  API.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//
//
import Foundation
import Moya
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
enum MyService {
    //    case showAccounts
    case users
}
// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    
    
    
    var baseURL: URL { return URL(string: "http://localhost:3000")! }
    var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }
    var method: Moya.Method {
        switch self {
        case .users:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .users: // Send no parameters
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .users:
            // Provided you have a file named accounts.json in your bundle.
            guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                return Data()
            }
            return data
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
    // MARK: - Helpers


