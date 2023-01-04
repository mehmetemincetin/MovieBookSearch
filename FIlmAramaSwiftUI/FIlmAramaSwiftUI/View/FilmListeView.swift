//
//  ContentView.swift
//  FIlmAramaSwiftUI
//
//  Created by EMİN ÇETİN on 2.01.2023.
//

import SwiftUI

struct FilmListeView: View {
    
     @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    
    @State var aranacakFilm = ""
    init () {
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack {
            
                TextField("Aranacak Film",text: $aranacakFilm ,onCommit: {self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                    
                }).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List(filmListeViewModel.filmler, id: \.imdbId) {
                film in
                NavigationLink(destination: DetayView(imdbId:film.imdbId),
            label: {
                    
                    HStack () {
                        OzelImage(url: film.poster)
                            .frame(width:90,height: 110)
                        VStack(alignment: .leading){
                            Text(film.title)
                                .font(.title)
                                .foregroundColor(.purple)
                            
                            
                            Text(film.year)
                                .foregroundColor(.orange)
                          }
                        }
                    } )
            }.navigationTitle(Text("Film Arama"))
        }
    }
  }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            FilmListeView()
        }
    }

