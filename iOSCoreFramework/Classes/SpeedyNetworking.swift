//
//  SpeedyNetworking.swift
//  Networking
//
//  Created by Gabe The Coder on 10/4/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

import UIKit

public class SpeedyNetworking {
    
    // MARK: Configuration
    public init() {}
    public class func setServerUrl(url: URL?) {
        SpeedyConfiguration.shared.defaultUrl = url
    }
    
    public class func setAuthHeader(authorization: String) {
        SpeedyConfiguration.shared.defaultAuthorizationHeader = authorization
    }
    public class func setCustomAuthHeader() {
        if let token = UserDefaults.standard.value(forKey: CoreConstants.TOKEN) as? String{
            SpeedyConfiguration.shared.defaultAuthorizationHeader = token
        }
    }
    //have to called by client framework
    public class func saveToken(token : String){
        UserDefaults.standard.set(token, forKey: CoreConstants.TOKEN)
    }
    //have to called by client framework
    public class func removeToken(){
    UserDefaults.standard.removeObject(forKey: CoreConstants.TOKEN)
    }
}

extension SpeedyNetworking {
    
    // MARK: HTTP GET
    
    public class func get(route: String, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(route: route)?.execute(completion: completion)
    }
    
    public class func getUrl(url: URL?, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(url: url)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP POST
    
    public class func post<T: Encodable>(route: String, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(route: route, method: .post, params: params)?.execute(completion: completion)
    }
    
    public class func postData(route: String, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(route: route, method: .post, params: params)?.execute(completion: completion)
    }
    
    public class func postUrl<T: Encodable>(url: URL?, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(url: url, method: .post, params: params)?.execute(completion: completion)
    }
    
    public class func postUrlData(url: URL?, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(url: url, method: .post, params: params)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP PUT
    
    public class func put<T: Encodable>(route: String, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(route: route, method: .put, params: params)?.execute(completion: completion)
    }
    
    public class func putData(route: String, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(route: route, method: .put, params: params)?.execute(completion: completion)
    }
    
    public class func putUrl<T: Encodable>(url: URL?, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(url: url, method: .put, params: params)?.execute(completion: completion)
    }
    
    public class func putUrlData(url: URL?, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(url: url, method: .put, params: params)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP DELETE
    
    public class func delete(route: String, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(route: route, method: .delete)?.execute(completion: completion)
    }
    
    public class func deleteURL(url: URL?, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(url: url, method: .delete)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: Downloaders
    
    public class func downloadImage(string: String, completion: @escaping (UIImage?) -> Void) {
        SpeedyDownload(string: string)?.executeImage(completion: completion)
    }
    
    public class func downloadImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        SpeedyDownload(url: url)?.executeImage(completion: completion)
    }
    
}
