//
//  ImageDownClient.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 3.01.2023.
//

import Foundation

class ImageDownLoaderCLient : ObservableObject  {
    @Published var indirilenGorsel : Data?
    
    func gorselIndir (url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
        }.resume()
    }
    
    
}
