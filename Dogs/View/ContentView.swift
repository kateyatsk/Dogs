//
//  ContentView.swift
//  Dogs
//
//  Created by Екатерина Яцкевич on 20.06.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.lightGreen
                .ignoresSafeArea() 
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.dogs, id: \.name) { dog in
                        DogCardView(dog: dog)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchRequest()
        }
    }
}


#Preview {
    ContentView()
}
