//
//  API.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import Moya

enum API {
    case popularNews
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popularNews:
            return "viewed/1.json"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popularNews:
            return .requestParameters(parameters: ["api-key": Constants.API.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [ "Accept" : "application/json" , "Content-Type" : "application/json"]
    }
}
