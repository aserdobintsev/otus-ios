//
//  ContentView.swift
//  Homework1-1
//
//  Created by Alexander Serdobintsev on 12/12/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    @State private var linkSelected: Int = 0
    private var filmListViewModel = FilmListViewModel()

    var body: some View {
        TabView(selection: $selection) {
            VStack {
                Button(action: {
                    self.selection = 1
                }) {
                    Text("Open Films")
                }
                Text("")
                Button(action: {
                    self.selection = 1
                    self.filmListViewModel.selected = self.filmListViewModel.films.first(where:){ film in return film.name.contains("Pulp") }?.id
                }) {
                    Text("Open Pulp Fiction")
                }
            }
            .tabItem {
                Image(systemName: "arrowshape.turn.up.right")
                Text("Refs")
            }
            .tag(0)

            FilmListView().environmentObject(filmListViewModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
            }
            .tag(1)

            AboutView()
                .tabItem() {
                    Image(systemName: "info.circle")
                    Text("About")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
