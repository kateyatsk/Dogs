//
//  Network.swift
//  Cryptocurrency
//
//  Created by Екатерина Яцкевич on 20.06.25.
//

import Foundation

class Network {
    let apiKey = "9/nHieFT3xm8jkW4b0htig==Y75lGMFV6DQKYqIj"
    
    func fetchData(completion: @escaping ([Dog]) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.api-ninjas.com"
        urlComponents.path = "/v1/dogs"
        urlComponents.queryItems = [
            URLQueryItem(name: "name", value: "terrier")
        ]
        
        guard let url  = urlComponents.url else {
            print(URLError.badURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("\(apiKey)", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, _,error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data else {
                print(URLError.dataNotAllowed)
                return
            }
            
            print("Размер ответа в байтах: \(data.count)")
            print(String(data: data, encoding: .utf8) ?? "Не удалось преобразовать в строку")
            
            do {
                let dogs = try JSONDecoder().decode([Dog].self, from: data)
                completion(dogs)

            } catch {
                print("Ошибка декодирования: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}
