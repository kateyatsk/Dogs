//
//  ViewModel.swift
//  Dogs
//
//  Created by Екатерина Яцкевич on 20.06.25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var dogs: [Dog] = []
    private let manager = Network()
    
    func fetchRequest() {
        manager.fetchData { [weak self] dogs in
            DispatchQueue.main.async {
                self?.dogs = dogs
            }
        }
    }
    
}
