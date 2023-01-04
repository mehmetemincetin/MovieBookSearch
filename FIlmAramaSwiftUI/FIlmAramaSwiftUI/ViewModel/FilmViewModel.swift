//
//  FilmViewModel.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 3.01.2023.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject {
    @Published var filmler = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi : String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case .success(let filmdizisi) :
                if let filmdizisi = filmdizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmdizisi.map(FilmViewModel.init)
                    }
                    
                }
            }
        }
    }
}

struct FilmViewModel {
    let film : Film
    var title: String {
        film.title
    }
    var poster : String{
        film.poster
    }
    var year : String {
        film.year
    }
    
    var imdbId : String {
        film.imdbId
        
    } 
}
