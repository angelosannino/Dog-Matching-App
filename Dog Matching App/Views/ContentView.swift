//
//  ContentView.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        TabView {
            DogFeedView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "network")
                    Text("Feed")
                }
            BreedsListView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Breeds")
                }
            FavouriteDogsView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
