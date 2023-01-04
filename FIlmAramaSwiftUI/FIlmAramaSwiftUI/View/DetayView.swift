//
//  DetayView.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 4.01.2023.
//

import SwiftUI

struct DetayView: View {
    
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack {
            
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.8,
                       height: UIScreen.main.bounds.height * 0.4,
                       alignment: .center)
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gosterilecek")
                .font(.title)
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Filmin Plani Gosterilecek")
                .padding()
            
            Text("Yonetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Film Ismi Gosterilecek")")
                .padding()
            
               
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Ismi Gosterilecek")")
                .padding()
            
            Text("Oduller: \(filmDetayViewModel.filmDetayi?.awards ?? "Oduller Gosterilecek")")
                .padding()
            
            Text("Yil: \(filmDetayViewModel.filmDetayi?.year ?? "Film Ciktigi Yil GOsterilecek")")
                .padding()

           
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
                
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
