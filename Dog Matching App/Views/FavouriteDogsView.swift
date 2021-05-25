//
//  FavouriteDogsView.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI

struct FavouriteDogsView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.favouriteDogs) { dog in
                            ZStack(alignment: .topTrailing) {
                                DogImageView(withURL: dog.url)
                                Button(action: {
                                    viewModel.unlikeDog(dog)
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 20))
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.gray)
                                        .shadow(radius: 5)
                                })
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding()
            .navigationTitle(Text("My Favourite Dogs"))
        }
        
    }
    
}

struct FavouriteDogsView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteDogsView(viewModel: ContentViewModel())
    }
}
