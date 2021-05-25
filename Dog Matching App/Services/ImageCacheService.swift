//
//  ImageCacheService.swift
//  Demo Photo App
//
//  Created by Angelo Sannino on 15/12/2020.
//

import SwiftUI

class ImageCacheService {
    
    static var  imageCache = [String:UIImage]()
    
    static func saveImage(url:String?, image: UIImage?) {
        
        if url == nil || image == nil {
            return
        }
        
        imageCache[url ?? ""] = image ?? UIImage()
        
    }
    
    static func getImage(url: String?) -> UIImage? {
        
        if url == nil {
            return nil
        }
        
        return imageCache[url ?? ""]
        
    }
    
}
