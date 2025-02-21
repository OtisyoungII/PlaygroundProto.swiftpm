import SwiftUI
import SceneKit

struct ContentView: View {
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
                        .padding(.top, 50) // Adds top padding to prevent the title from sticking to the top


                    // The rotating sphere in the middle
                    GeometryReader { geometry in
                        RotatingSphereView()
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                            .padding(.vertical, -100) // Adds vertical padding to center it
                    }
                    .frame(maxHeight: 300) // Limit the max height of the GeometryReader to keep the sphere in a proper range

                    // Spacer to push the start button towards the bottom
                    Spacer()
                    

                    // Start Button
                    NavigationLink(destination: FieldView()) {
                        Text("START")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: .yellow, radius: 5)
                    }
                    .padding(.bottom, 50) // Adds padding to ensure it is not stuck at the bottom
                }
                .frame(maxHeight: .infinity) // Ensures the VStack takes up the full available space
            }
        }
    }
}

// A SwiftUI view that wraps a SceneKit view for rendering the rotating sphere
struct RotatingSphereView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RotatingSphereViewController {
        return RotatingSphereViewController()
    }
    
    func updateUIViewController(_ uiViewController: RotatingSphereViewController, context: Context) {
        // Update the view if needed (e.g., for state changes)
    }
}

class RotatingSphereViewController: UIViewController {
    var sceneView: SCNView!
    var scene: SCNScene!
    var sphereNode: SCNNode!
    
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
        
        // Create a sphere geometry and node
        let sphereGeometry = SCNSphere(radius: 1)
        sphereNode = SCNNode(geometry: sphereGeometry)
        
//        let texture = SCNMaterial()
        //
//        texture.diffuse.contents = UIColor.yellow
//        sphereGeometry.materials = [texture]
        
        // Apply baseball texture to the sphere
        if let baseballTexture = UIImage(named: "BaseballTexture") {
            sphereGeometry.firstMaterial?.diffuse.contents = baseballTexture
            scene.rootNode.addChildNode(sphereNode)
        }
        
        // Apply rotation animation to the sphere
        let rotationAction = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 7)
        let repeatAction = SCNAction.repeatForever(rotationAction)
        sphereNode.runAction(repeatAction)
        
        
        
    }
    
}
        
    

