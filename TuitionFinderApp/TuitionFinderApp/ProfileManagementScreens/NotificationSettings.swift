import SwiftUI

struct NotificationSettings: View {
    @State private var toneEnabled = false
    @State private var notificationEnabled = false
    @State private var reminderEnabled = false
    
    
    var body: some View {
       
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Notifications")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 5)
                
               
                
                Toggle("Notification Enable", isOn: $notificationEnabled)
                    .padding(.horizontal)
                    .font(.body)
                    .foregroundColor(.black)
                    
                
                
                Divider().padding(.horizontal)
                
                
                Toggle("Notification Tone", isOn: $toneEnabled)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                Divider().padding(.horizontal)
                
            
                
                Toggle("Reminders", isOn: $reminderEnabled)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                Divider().padding(.horizontal)
                Spacer()
            }
            
                        
                    }
                }
            
        
    


#Preview {
    NotificationSettings()
}

