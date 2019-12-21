//
//  FilmListView.swift
//  Homework1-1
//
//  Created by Alexander Serdobintsev on 12/14/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import SwiftUI

final class FilmListViewModel: ObservableObject {
    @Published private(set) var films = [Film(name: "The Matrix", year: 1999),
                                         Film(name: "Pulp Fiction", year: 1994),
                                         Film(name: "What Dreams May Come", year: 1998),
                                         Film(name: "Inception", year: 2010),
                                         Film(name: "The Dark Knight", year: 2008)

    ]
    @Published var selected: UUID? = nil
}

struct Film: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
}

struct FilmListView: View {
    @EnvironmentObject var viewModel: FilmListViewModel
    @State private var action: Int? = 0

    var body: some View {
        let selected = Binding.init(
            get: { self.viewModel.selected },
            set: { self.viewModel.selected = $0 }
        )
        return NavigationView {
            List {
                ForEach(viewModel.films) { film in
                    NavigationLink.init(
                        film.name,
                        destination: FilmView(name: film.name, year: film.year),
                        tag: film.id,
                        selection: selected)
                }
            }.navigationBarTitle("Films")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
