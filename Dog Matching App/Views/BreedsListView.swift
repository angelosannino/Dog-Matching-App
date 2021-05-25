//
//  BreedsListView.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI

struct BreedsListView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.breedsList, id:\.self) { breed in
                    NavigationLink(
                        destination: DogsByBreedView(viewModel: viewModel, breed: breed),
                        label: {
                            Text(breed.capitalized)
                                .font(.headline)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                )
                        })
                }
            }
            .onAppear() {
                viewModel.downloadBreeds()
            }
            .navigationTitle(Text("Breeds List"))
        }
        
    }
    
}

struct BreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsListView(viewModel: ContentViewModel())
    }
}
