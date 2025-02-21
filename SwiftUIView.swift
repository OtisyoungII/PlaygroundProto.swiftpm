//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/21/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        // Button to open the player menu
        //        HStack {
        //            Button(action: {
        //                withAnimation {
        //                    isMenuOpen.toggle()
        //                }
        //            }) {
        //                Text("Menu")
        //                    .fontWeight(.bold)
        //                    .padding()
        //                    .background(Color.orange)
        //                    .foregroundColor(.white)
        //                    .cornerRadius(10)
        //            }
        //            .padding(.top, 20)
        //
        //            Spacer()
        //        }
        
        Text("Hello, World!") }
}

//NavigationLink(destination: PlayersView()) {
//    Text("Go to Players View")
//        .font(.title2)
//        .fontWeight(.bold)
//        .foregroundColor(.white)
//        .padding()
//        .background(Color.orange)
//        .cornerRadius(10)
//}
//}
//.padding()
#Preview {
    SwiftUIView()
}
