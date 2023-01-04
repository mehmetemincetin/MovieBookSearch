//
//  DownloaderClient.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 2.01.2023.
//

import Foundation
class DownloaderClient {

    func filmleriIndir(search:String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void) {
        guard let url = URL(string:"https://www.omdbapi.com/?s=\(search)&apikey=cd45c27b")
        else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data ,error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenmedi))
            }
            completion(.success(filmCevabi.filmler))
        }.resume()

    }

    
    
    
    func filmDetayIndir (imdbId: String,completion: @escaping (Result<FilmDetay,DownloaderError>) -> Void ) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=cd45c27b") else {
            return completion(.failure(.yanlisUrl))
        }
  
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    return completion(.failure(.veriGelmedi))
                }
                guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self,from:data) else {
                    return completion(.failure(.veriIslenmedi))
                }
                completion(.success(gelenFilmDetayi))
            }.resume()
    }
}



enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}

