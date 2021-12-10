//
//  ImageDownloadOperation.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 10.09.21.
//

import UIKit

typealias ImageDownloadHandler = (UIImage) -> Void

class ImageDownloadOperation: Operation {
    var image: UIImage?
    var url: String = ""
    var completion: ImageDownloadHandler?
    
    func initWithUrl(_ url: String) {
        self.url = url
    }
    
    override func main() {
        if isCancelled { return }
        
        guard let imageUrl = URL(string: self.url) else { return }
        URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
            guard let self = self else { return }
            if self.isCancelled { return }
            guard let imageData = data, let image = UIImage(data: imageData) else { return }
            self.image = image
            if ((self.completion) != nil) {
                self.completion!(self.image!)
            }
            
        }.resume()
        
    }

}
