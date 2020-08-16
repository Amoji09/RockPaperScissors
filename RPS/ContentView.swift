//
//  ContentView.swift
//  RPS
//
//  Created by Amogh Mantri on 8/9/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let imageArray = [Image("Paper"),Image("Scissors"),Image("Rock")]
    @State private var bot = 0
    @State private var player = 1
    @State private var result = ""
    var body: some View {
        ZStack{
            Color.gray
            VStack{
                Text(self.result)
                HStack{
                    imageArray[self.bot].resizable().frame(width: 128.0, height: 128.0)
                    imageArray[self.player].resizable().frame(width: 128.0, height: 128.0).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
                HStack{
                    Button(action: {
                        self.player = 2
                        self.bot = Int.random(in: 0..<3)
                        self.checkWin()
                    }) {
                        ZStack{
                            Image("Rock").resizable().frame(width: 64.0, height: 64.0)
                            Text("Rock").foregroundColor(Color.black)
                        }
                    }
                    Button(action: {
                        self.player = 0
                        self.bot = Int.random(in: 0..<3)
                        self.checkWin()
                    }) {
                        ZStack{
                            Image("Paper").resizable().frame(width: 64.0, height: 64.0)
                            Text("Paper").foregroundColor(Color.black)
                        }
                    }
                    Button(action: {
                        self.player = 1
                        self.bot = Int.random(in: 0..<3)
                        self.checkWin()
                    }) {
                        ZStack{
                            Image("Scissors").resizable().frame(width: 64.0, height: 64.0)
                            Text("Scissors").foregroundColor(Color.black)
                        }
                    }
                }.padding()
            }
            
        }
    }
    
    func checkWin(){
        if(self.player == 0 && self.bot == 1){
            self.result = "You lose!"
        }
        else if(self.player == 0 && self.bot == 2){
            self.result = "You win!"
        }
        else if(self.player == 0 && self.bot == 0){
            self.result = "You tie!"
        }
        else if(self.player == 1 && self.bot == 0){
            self.result = "You win!"
        }
        else if(self.player == 1 && self.bot == 2){
            self.result = "You lose!"
        }
        else if(self.player == 1 && self.bot == 1){
            self.result = "You tie!"
        }
        else if(self.player == 2 && self.bot == 0){
            self.result = "You lose!"
        }
        else if(self.player == 2 && self.bot == 1){
            self.result = "You win!"
        }
        else if(self.player == 2 && self.bot == 2){
            self.result = "You tie!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
