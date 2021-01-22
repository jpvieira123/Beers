//
//  ImageLoader.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//

import UIKit

final class ImageLoader: UIImageView {
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    func loadImage(urlString: String) {
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Couldn't download image: ", error)
                return
            }

            guard let data = data else { return }
            let image = UIImage(data: data)
            self.imageCache.setObject(image as AnyObject,
                                      forKey: urlString as AnyObject)

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
