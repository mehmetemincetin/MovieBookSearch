//
//  FilmDetayViewModel.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 4.01.2023.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let downloaderClient = DownloaderClient()
    func filmDetayiAl (imdbId: String ) {
        downloaderClient.filmDetayIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmdetay):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariViewModel(detay: filmdetay)
                }
                
            }
        }
    }
}

struct FilmDetaylariViewModel {
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    var poster : String {
        detay.poster
    }
    var year : String {
        detay.year
    }
    var imdbId : String {
        detay.imdbId
    }
    var director : String {
        detay.writer
    }
    var awards : String {
        detay.awards
    }
    var plot : String {
        detay.plot
        
    }
    var writer : String {
        detay.writer
    }
    
    
}
