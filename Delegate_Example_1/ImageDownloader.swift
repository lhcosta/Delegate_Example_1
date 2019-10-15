//
//  LogoDowloander.swift
//  Delegate_Example_1
//
//  Created by Lucas Costa  on 03/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import Foundation

protocol ImageDownloaderDelegate : AnyObject {
    func didFinishDownloading(data : Data, completionHandler : @escaping (String) -> Void)
}

struct ImageDownloader {
    
    private weak var delegate : ImageDownloaderDelegate?
    
    private var url : URL
    
    init(_ delegate : ImageDownloaderDelegate, url : URL) {
        self.delegate = delegate
        self.url = url
    }
        
    func downloadingImage() {
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: self.url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                if let data = data {
                    
                    DispatchQueue.main.async {
                        self.delegate?.didFinishDownloading(data: data, completionHandler: { (name) in 
                            print(name)
                        })
                    }                    
                }
            }
        }
        
        task.resume()
    }
    
    
    
}
