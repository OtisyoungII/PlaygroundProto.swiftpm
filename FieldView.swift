//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/15/25.
//



import SwiftUI

// Define the Player model with all the details
struct Player {
    var name: String
    var number: String
    var position: String
    var battingOrder: String
    var strength: String
    var speed: String
    var onBasePercentage: String
    var stats: String
    var injuries: String
    var accomplishments: String

    // Add property for the asset names
    var assetName: String {
        switch name {
        case "Mookie Betts":
            return "MookieBetts1"
        case "Marcus Semien":
            return "MarcusSemien1"
        case "Aaron Judge":
            return "AaronJudge1"
        case "Michael Harris":
            return "MichaelHarris1"
        default:
            return "Baseballs" // Default image
        }
    }
}

struct FieldView: View {
    // List of players with their detailed information
    let players = [
        Player(name: "Mookie Betts", number: "50", position: "Right Field", battingOrder: "Lead-Off", strength: "Power Hitter", speed: "High", onBasePercentage: ".350", stats: "2021: 29 HRs, 79 RBIs, .292 AVG", injuries: "None", accomplishments: "2018 AL MVP, 5x Gold Glove"),
        Player(name: "Marcus Semien", number: "2", position: "Shortstop", battingOrder: "2nd", strength: "Contact Hitter", speed: "Moderate", onBasePercentage: ".360", stats: "2021: 45 HRs, 102 RBIs, .265 AVG", injuries: "None", accomplishments: "2x All-Star"),
        Player(name: "Aaron Judge", number: "99", position: "Right Field", battingOrder: "Clean-Up", strength: "Power Hitter", speed: "Moderate", onBasePercentage: ".380", stats: "2021: 39 HRs, 98 RBIs, .287 AVG", injuries: "None", accomplishments: "2017 AL Rookie of the Year, 2x All-Star"),
        Player(name: "Michael Harris", number: "23", position: "Center Field", battingOrder: "9th", strength: "Speed", speed: "Elite", onBasePercentage: ".330", stats: "2021: 3 HRs, 10 RBIs, .311 AVG", injuries: "None", accomplishments: "2021: MLB debut, 5x SBs")
    ]
    
    @State private var isMenuOpen = false
    @State private var selectedPlayer: Player? = nil
    @State private var isBaseballClickable = false
    @State private var navigateToPlayersView = false

    // Resetting the player
    func resetPlayer() {
        selectedPlayer = nil
        isBaseballClickable = false
    }
    
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
                        .foregroundColor(.blue)
                        .padding()
                        .padding(.top, 20)
                    Spacer()
                    
                    // Baseball image that shows the player's number when selected
                    Image(selectedPlayer?.assetName ?? "Baseballs") // Use the player's asset image or default to "Baseballs"
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.blue)
                        .padding(.top, 20)
                        .overlay(
                            Group {
                                if let player = selectedPlayer {
                                    Text("#\(player.number)")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
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
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                                .padding(.top, 20)
                        }
                        .padding(.trailing, 20) // Add right padding to give space from the edge
                    }
                    Spacer()
                }
                .padding(.top, 40) // Makes sure the button stays within the safe area

                // Pop-Up menu for players that appears when isMenuOpen is true
                if isMenuOpen {
                    VStack {
                        VStack {
                            Text("Select a Player")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding()

                            List(players, id: \.name) { player in
                                Button(action: {
                                    // Update selected player and player number
                                    selectedPlayer = player
                                    isBaseballClickable = true // Enable player now click after a player is selected
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
            .navigationDestination(isPresented: $navigateToPlayersView) {
                if let selectedPlayer = selectedPlayer {
                    // Pass selected player to PlayersView and resetPlayer function
                    PlayersView(player: selectedPlayer, resetPlayer: resetPlayer)
                }
            }
        }
        .padding(.top, 40) // Ensure everything is in the safe area
    }
}


#Preview {
    FieldView()
}
