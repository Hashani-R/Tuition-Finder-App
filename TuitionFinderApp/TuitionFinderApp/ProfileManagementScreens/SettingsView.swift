import SwiftUI

struct SettingsView: View {
    @State private var faceIDEnabled = false
    //@State private var notificationEnabled = false
    @State private var darkModeEnabled = false
    @State private var accessibilityEnabled = false
    
    var body: some View {
       
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
              // Account settings
                Text("Account")
                    .font(.headline)
                    .padding(.horizontal)
                
                Toggle("Face ID login", isOn: $faceIDEnabled)
                    .padding(.horizontal)
                    .font(.callout)
                    .foregroundColor(.black)
                    
                
                
                Divider().padding(.horizontal)
                
                /*Text("Notification")
                    .font(.headline)
                    .padding(.horizontal)
                
                Toggle("Enable Notification", isOn: $notificationEnabled)
                    .padding(.horizontal)
                
                Divider().padding(.horizontal)*/
                
                // Accessibility Section
                Text("Theme")
                    .font(.headline)
                    .padding(.horizontal)
                
                Toggle("Dark Mode", isOn: $darkModeEnabled)
                    .padding(.horizontal)
                
                Divider().padding(.horizontal)
                
                
                Text("Accesibility")
                    .font(.headline)
                    .padding(.horizontal)
                
                Toggle("Provide descriptive info about user interfaces", isOn: $accessibilityEnabled)
                    .padding(.horizontal)
                Divider().padding(.horizontal)
                Spacer()
            }
            
                        
                    }
                }
            
        
    


#Preview {
    SettingsView()
}

