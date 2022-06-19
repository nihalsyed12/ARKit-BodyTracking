//
//  ContentView.swift
//  BodyTracking
//
//  Created by Nihal Syed on 2022-06-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
