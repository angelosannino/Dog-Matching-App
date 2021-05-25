//
//  DogImageView.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI

struct DogImageView: View {
    
    @ObservedObject var imageLoader:ImageLoader
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {

            Image(uiImage: imageLoader.image)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .scaledToFit()
                .padding(25)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
            )
        
    }
    
}

struct DogImageView_Previews: PreviewProvider {
    static var previews: some View {
        DogImageView(withURL: "https://images.dog.ceo/breeds/terrier-yorkshire/n02094433_5176.jpg")
            .previewLayout(.sizeThatFits)
    }
}
