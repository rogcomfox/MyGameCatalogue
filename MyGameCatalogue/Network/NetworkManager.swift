//
//  NetworkManager.swift
//  MyGameCatalogue
//
//  Created by Joe G on 23/07/20.
//  Copyright © 2020 Nusantarian. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class NetworkManager: ObservableObject {
    @Published var games = GamesList(result: [])
    @Published var loading = false
    private let api_key = ""
    private let api_url_base = "https://api.rawg.io/api/games"
    
    init(){
        loading = true;
        loadAlamofire()
    }
    
    private func loadData(){
        guard let url = URL(string: "\(api_url_base)\(api_key)") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else {return}
            let games = try! JSONDecoder().decode(GamesList.self, from: data)
            DispatchQueue.main.async {
                self.games = games
                self.loading = false
            }
        }
    }
    
    private func loadAlamofire(){
        AF.request("\(api_url_base)\(api_key)")
            .responseJSON{ response in
                guard let data = response.data else {return}
                let games = try! JSONDecoder().decode(GamesList.self, from: data)
                DispatchQueue.main.async {
                    self.games = games
                    self.loading = false
                }
        }
    }
}
