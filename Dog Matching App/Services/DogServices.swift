//
//  DogServices.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class DogServices {
    
    static func getRandomDogImage(breed: String? = nil, completion: @escaping (Dog?) ->()) {
        
        var url: String {
            if let breed = breed {
                return "https://dog.ceo/api/breed/\(breed)/images/random"
            } else {
                return AccessDetails.Images.URL
            }
        }
        
        AF.request(url).responseJSON { response in
            
            if let error = response.error {
                debugPrint("ERRORE:")
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let ilJson = response.value else {
                debugPrint("JSON Non valido / non trovato")
                return
            }
            
            guard let json = JSON(ilJson).dictionary else { return }
            
            if let dog = Dog(json) {
                completion(dog)
            } else {
                completion(nil)
            }
            
        }
        
    }
    
    static func getBreedsList(completion: @escaping ([String]) ->()) {
        
        var breeds: [String] = []
        
        AF.request(AccessDetails.Breeds.URL).responseJSON { response in
            
            if let error = response.error {
                debugPrint("ERRORE:")
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let ilJson = response.value else {
                debugPrint("JSON Non valido / non trovato")
                return
            }
            
            guard let json = JSON(ilJson)["message"].dictionary else { return }
            
            for breed in json.keys {
                if !breeds.contains(breed) {
                    breeds.append(breed)
                }
            }
            
            completion(breeds)
            
        }
        
    }
    
}
