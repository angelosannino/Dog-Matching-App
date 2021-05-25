//
//  DogsByBreedView.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI

struct DogsByBreedView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    var breed: String
    
    var body: some View {
        
        VStack(spacing: 15) {
            ZStack(alignment: .topTrailing) {
                DogImageView(withURL: viewModel.currentImageURL)
                    .padding()
                    .gesture(DragGesture().onEnded({ value in
                        if value.translation.width < 0 {
                            viewModel.showRandomDog(breed)
                        }
                    }))
                Button(action: {
                    viewModel.likeDog()
                }, label: {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 30))
                        .frame(width: 35, height: 35)
                        .foregroundColor(viewModel.currentDog?.favourite ?? false ? .red : .gray)
                        .shadow(radius: 5)
                })
                .padding(15)
            }
            Text("Swipe Left to get a new dog!")
                .font(.headline)
        }
        .navigationTitle(Text("Breed: \(breed.capitalized)"))
        .onAppear() {
            viewModel.showRandomDog(breed)
        }
        
    }
}

struct DogsByBreedView_Previews: PreviewProvider {
    static var previews: some View {
        DogsByBreedView(viewModel: ContentViewModel(), breed: "hound")
    }
}
