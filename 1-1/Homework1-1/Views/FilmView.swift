//
//  FilmView.swift
//  Homework1-1
//
//  Created by Alexander Serdobintsev on 12/14/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import SwiftUI

struct FilmView: View {
    private let name: String
    private let year: Int

    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }

    var body: some View {
        VStack {
            Spacer()
            Text(name)
            Spacer()
            Text(String(year))
            Spacer()
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(name: "Test", year: 444)
    }
}
