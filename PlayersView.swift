//
//  SwiftUIView.swift
//  PlaygroundProto
//
//  Created by Otis Young on 2/21/25.
//

import SwiftUI
import SceneKit

struct PlayersView: View {
    var player: Player // Receive the selected player
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.green, Color(.black)]), center: .center, startRadius: 250, endRadius: 900)
                    .ignoresSafeArea()
                
                VStack {
                    // Title at the top
                    Text("BlackBallers")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .yellow, radius: 12)
                        .padding(.top, 50)
                    
                    // The rotating square in the middle with the player image
                    GeometryReader { geometry in
                        RotatingSquareView(player: player) // Pass player data to RotatingSquareView
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                            .padding(.vertical, -100)
                    }
                    .frame(maxHeight: 300)
                    
                    // Player details
                    VStack(spacing: 10) {
                        Text(player.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Position: \(player.position)")
                            .foregroundColor(.white)
                        
                        Text("Batting Order: \(player.battingOrder)")
                            .foregroundColor(.white)
                        
                        Text("Strength: \(player.strength)")
                            .foregroundColor(.white)
                        
                        Text("Speed: \(player.speed)")
                            .foregroundColor(.white)
                        
                        Text("On-Base %: \(player.onBasePercentage)")
                            .foregroundColor(.white)
                        
                        Text("Stats: \(player.stats)")
                            .foregroundColor(.white)
                        
                        Text("Injuries: \(player.injuries)")
                            .foregroundColor(.white)
                        
                        Text("Accomplishments: \(player.accomplishments)")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    .padding()
                    
                    // Spacer to push the start button towards the bottom
                    Spacer()
                    
                    // Back Button to return to FieldView
                    NavigationLink(destination: FieldView()) {
                        Text("Back to The Field")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: .yellow, radius: 5)
                    }
                    .padding(.bottom, 50)
                }
                .frame(maxHeight: .infinity)
            }
        }
    }
}

// A SwiftUI view that wraps a SceneKit view for rendering the rotating square
struct RotatingSquareView: UIViewControllerRepresentable {
    var player: Player // Receive the player data
    
    func makeUIViewController(context: Context) -> RotatingSquareViewController {
        return RotatingSquareViewController(player: player)
    }
    
    func updateUIViewController(_ uiViewController: RotatingSquareViewController, context: Context) {
        // Update the view if needed (e.g., for state changes)
    }
}

class RotatingSquareViewController: UIViewController {
    var sceneView: SCNView!
    var scene: SCNScene!
    var squareNode: SCNNode!
    var player: Player // Receive the player data
    
    init(player: Player) {
        self.player = player
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the scene and the scene view
        sceneView = SCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)
        
        scene = SCNScene()
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        // Set the SCNView background to transparent
        sceneView.backgroundColor = .clear
        
        // Create a camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        // Create a square geometry and node
        let squareGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        squareNode = SCNNode(geometry: squareGeometry)
        
        // Apply player image texture to the square
        if let playerImage = UIImage(named: player.assetName) {
            squareGeometry.firstMaterial?.diffuse.contents = playerImage
        }
        
        scene.rootNode.addChildNode(squareNode)
        
        // Apply rotation animation to the square
        let rotationAction = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 10)
        let repeatAction = SCNAction.repeatForever(rotationAction)
        squareNode.runAction(repeatAction)
    }
}
