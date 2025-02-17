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
//            Image("CloseFieldView.jpg")
//                .resizable()
//                .scaledToFill()
//            
//            .ignoresSafeArea()

            // You can add more elements here if needed, like other shapes or text
            VStack {
                Text("Black King Baseball")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
} 

#Preview {
    FieldView()
}
