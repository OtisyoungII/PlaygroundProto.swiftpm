//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/21/25.
//

import SwiftUI
import SceneKit

struct PlayersView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.green, Color(.black)]), center: .center, startRadius: 250, endRadius: 900)
                    .ignoresSafeArea()
                
                VStack {
                    // Title at the top
                    Text("PLayers View")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .yellow, radius: 12)
                        .padding(.top, 50) // Adds top padding to prevent the title from sticking to the top
                    
                    

                    
                    
                }
            }
        }
        
        

            PlayersView()
        }
    }

