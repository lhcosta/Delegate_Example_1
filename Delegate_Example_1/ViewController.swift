//
//  ViewController.swift
//  Delegate_Example_1
//
//  Created by Lucas Costa  on 03/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var logoImage: UIImageView!
    var imageDownloader : ImageDownloader?
    
    let url = URL(string: "https://images.freeimages.com/images/large-previews/4dc/street-1366583.jpg")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageDownloader = ImageDownloader(self, url: url)
        self.imageDownloader?.downloadingImage()
    }
    
}

extension ViewController : ImageDownloaderDelegate {
    
    func didFinishDownloading(data: Data, completionHandler: @escaping (String) -> Void) {
        self.logoImage.image = UIImage(data: data)
        completionHandler("Testando Closure")
    }
    
}
