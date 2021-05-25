//
//  ContentViewModel.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var dogs: [Dog] = []
    @Published var favouriteDogs: [Dog] = []
    @Published var breedsList: [String] = []
    
    @Published var currentDog: Dog?
    
    var currentImageURL: String {
        return currentDog?.url ?? ""
    }
    
    func showRandomDog(_ breed: String? = nil) {
        
        DogServices.getRandomDogImage(breed: breed) { dog in
            
            if let dog = dog {
                self.currentDog = dog
                if !self.dogs.contains(where: { $0.id == dog.id }) {
                    self.dogs.append(dog)
                }
            }
            
        }
        
    }
    
    func downloadBreeds() {
        
        DogServices.getBreedsList { breeds in
            self.breedsList = breeds
        }
        
    }
    
    func likeDog() {
        
        if let dog = self.currentDog {
            if dog.favourite {
                dog.favourite = false
                guard let index = self.favouriteDogs.firstIndex(where: { $0.id == dog.id }) else { return }
                self.favouriteDogs.remove(at: index)
            } else {
                dog.favourite = true
                if !self.favouriteDogs.contains(where: { $0.id == dog.id }) {
                    self.favouriteDogs.append(dog)
                }
            }
        }
        
    }
    
    func unlikeDog(_ dog: Dog) {
        
        guard let index = self.favouriteDogs.firstIndex(where: { $0.id == dog.id }) else { return }
        self.favouriteDogs.remove(at: index)
        
    }
    
}
