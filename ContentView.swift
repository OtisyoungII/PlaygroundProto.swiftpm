import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.green, Color("DarkYellow")]), center: .center, startRadius: 250, endRadius: 900)
                    .ignoresSafeArea()
                VStack {
                    
                    
                    
                    Text("BlackBallers")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .yellow, radius: 12)
                        .padding()
                    
                    
                    
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
                    
                }
                    
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
            }
        
}
    
    
    
    
    

