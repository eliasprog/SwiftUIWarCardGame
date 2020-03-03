//
//  ContentView.swift
//  SwiftUIWarCardGame
//
//  Created by Elias Ferreira on 03/03/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = 0
    @State private var randNum2 = 0
    
    @State private var plrScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            Spacer()
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("logo")
                
                Spacer()
                
                HStack{
                    Image("card" + String(randNum1))
                        .padding(.trailing, 20)
                    Image("card" + String(randNum2))
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.randNum1 = Int.random(in: 2...14)
                    self.randNum2 = Int.random(in: 2...14)
                    
                    if self.randNum1 > self.randNum2 {
                        self.plrScore += 1
                    } else if self.randNum1 < self.randNum2 {
                        self.cpuScore += 1
                    }
                    
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(self.plrScore))
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    Spacer()
                    VStack {
                        Text("CPU")
                            .bold()
                            .padding(.leading, 20)
                        Text(String(self.cpuScore))
                    }
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
