//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 31/03/26.
//

import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func load(fromURLString urlString: String) {
        networkManager.downloadImage(fromURLString: urlString, completed: { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        })
    }
    
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}
 
struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
