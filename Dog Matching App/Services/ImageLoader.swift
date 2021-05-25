//
//  ImageLoader.swift
//  Demo Photo App
//
//  Created by Angelo Sannino on 15/12/2020.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image = UIImage() {
        didSet {
            objectWillChange.send()
        }
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    init(urlString:String) {
        if let data = ImageCacheService.getImage(url: urlString) {
            debugPrint("Immagine presa dalla cache")
            self.image = data
        } else {
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                debugPrint("Scaricata nuova immagine")
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.image = image
                        ImageCacheService.saveImage(url: url.absoluteString, image: image)
                    }
                }
            }
            task.resume()
        }
    }
}
