//
//  ContentView.swift
//  AuthTestApp
//
//  Created by Эльдар Айдумов on 04.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            if let apiKey = Secrets.googleAPIKey {
                print("Google API Key: \(apiKey)")
            } else {
                print("Google API Key not found.")
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
