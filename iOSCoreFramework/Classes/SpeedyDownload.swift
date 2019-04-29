//
//  SpeedyDownload.swift
//  Networking
//
//  Created by Gabe The Coder on 10/4/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

import UIKit

public class SpeedyDownload {
    
    var downloadURL: URL!
    public init() {}
    public init?(url: URL?) {
        if let preparedUrl = url {
            downloadURL = preparedUrl
        } else {
            return nil
        }
    }
    
    public init?(string: String) {
        if let stringUrl = URL(string: string) {
            downloadURL = stringUrl
        } else {
            return nil
        }
    }
    
    public func execute(completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: downloadURL) { data, response, error in
            DispatchQueue.main.async { completion(data) }
        }.resume()
    }
    
    public func executeImage(completion: @escaping (UIImage?) -> Void) {
        execute { data in
            guard let imageData = data else { return completion(nil) }
            guard let downloadedImage = UIImage(data: imageData) else { return completion(nil) }
            
            completion(downloadedImage)
        }
    }
    
}
