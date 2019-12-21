//
//  AboutView.swift
//  Homework1-1
//
//  Created by Alexander Serdobintsev on 12/14/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    @State private var showModal: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                self.showModal = true
            }) {
                Text("Easter egg")
            }.betterSheet(isPresented: self.$showModal, onDismiss: { print ("Easter egg dismissed")}){
                EasterEggView(isPresented: self.$showModal)
            }
        }
    }
}

struct EasterEggView: View {

    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("☦️🥚🙏")
                .font(.largeTitle)
            Button(action:{
                self.isPresented = false
            }){
                Text("Crack")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
