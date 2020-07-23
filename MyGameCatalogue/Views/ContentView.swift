//
//  ContentView.swift
//  MyGameCatalogue
//
//  Created by Joe G on 12/07/20.
//  Copyright © 2020 Nusantarian. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            VStack{
                if networkManager.loading{
                    Text("Loading...")
                } else {
                    List(networkManager.games.result){game in
                        NavigationLink(destination: GameDetail(game: game)){
                            GameRow(game: game)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Movies"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
