//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/15/25.
//



import SwiftUI

// Define the Player model
struct Player {
    var name: String
    var number: String
}

struct FieldView: View {
    // List of players
    let players = [
        Player(name: "Mookie Betts", number: "50"),
        Player(name: "Mike Trout", number: "27"),
        Player(name: "Aaron Judge", number: "99"),
        Player(name: "Shohei Ohtani", number: "17")
    ]
    
    // State to track whether the menu is shown
    @State private var isMenuOpen = false
    
    // State to track the selected player and their number
    @State private var selectedPlayer: Player? = nil
    
    // State to track whether the baseball is clickable
    @State private var isBaseballClickable = false
    
    // State to control navigation to PlayersView
    @State private var navigateToPlayersView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Custom background image
                Image("CloseFieldView")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Text("Leaders In The Game")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                    
                    Spacer()
                    
                    // Baseball image that shows the player's number when selected
                    Image("Baseballs")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                        .overlay(
                            // Display the player number if a player is selected
                            Group {
                                if let player = selectedPlayer {
                                    Text("#\(player.number)")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                        .transition(.scale)
                                }
                            }
                        )
                        .onTapGesture {
                            // Make sure the baseball is clickable only after a player is selected
                            if isBaseballClickable {
                                print("Baseball tapped! Navigate to PlayersView.")
                                navigateToPlayersView = true
                            }
                        }
                    
                    Spacer()
                }
                
                // Button to open the player menu, positioned in the top-right corner
                VStack {
                    HStack {
                        Spacer() // Push the button to the right edge
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Text("Players")
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, 20) // Add top padding to ensure it's within the safe area
                        }
                        .padding(.trailing, 20) // Add right padding to give space from the edge
                    }
                    Spacer()
                }
                .padding(.top, 40) // Ensures the button stays within the safe area

                // Sliding menu for players that appears when isMenuOpen is true
                if isMenuOpen {
                    VStack {
                        VStack {
                            Text("Select a Player")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()

                            List(players, id: \.name) { player in
                                Button(action: {
                                    // Update selected player and player number
                                    selectedPlayer = player
                                    isBaseballClickable = true // Enable baseball click after a player is selected
                                    withAnimation {
                                        isMenuOpen.toggle() // Close the menu after selecting a player
                                    }
                                }) {
                                    Text("\(player.name) - #\(player.number)")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(5)
                                }
                            }
                            .frame(width: 300, height: 300)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                        }
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                        .transition(.move(edge: .trailing))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                }
            }
            
            // Navigation to PlayersView using the new NavigationLink method
            NavigationLink(
                value: navigateToPlayersView,
                label: { EmptyView() }
            )
            .navigationDestination(isPresented: $navigateToPlayersView) {
                PlayersView() // Navigate to PlayersView when triggered
            }
        }
        .padding(.top, 40) // Ensure everything is within the safe area
    }
}

#Preview {
    FieldView()
}
