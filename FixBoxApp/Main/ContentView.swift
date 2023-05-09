//
//  ContentView.swift
//  FixBoxApp
//
//  Created by Nail Sharipov on 09.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject
    var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationSplitView {
            List($viewModel.scenes, selection: $viewModel.selection) { $scene in
                NavigationLink(scene.title, value: scene)
            }
        } detail: {
            viewModel.contentView
        }
        .navigationTitle("FixBox")
        .navigationSubtitle("FixBox")
        .onAppear() {
            viewModel.onAppear()
        }
    }
}
