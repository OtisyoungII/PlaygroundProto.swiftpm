//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/15/25.
//


import SwiftUI

struct FieldView: View {
    var body: some View {
        
        ZStack {
            // Custom gradient background using a mesh-like pattern
            //            Color.blue
            Image("CloseFieldView")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // You can add more elements here if needed, like other shapes or text
            NavigationStack {
                
                
                VStack {
                    Text("Black King Baseball")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                NavigationLink {
                    PlayersView()
                    
                } label: {
                    
                    
                    Image("MookieBetts1")
                        .resizable()
                        .frame(width: 20, height: 25)
                        .foregroundStyle(.white)
                        .padding(.trailing)
                    
                    
                    
                }
                
            }
            }
        }
    }
    #Preview {
        FieldView()
    }
    

