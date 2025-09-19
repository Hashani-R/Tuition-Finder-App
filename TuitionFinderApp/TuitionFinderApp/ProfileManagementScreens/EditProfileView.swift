import SwiftUI

struct EditProfileView: View {
    @State private var name: String = "Nishadi Perera"
    @State private var address: String = "No, 123, Mosque road, Colombo 10"
    @State private var username: String = "@nethmi_p"
    @State private var about: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
                Text("Edit Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5.0)
                
                
                ZStack(alignment: .bottomTrailing) {
                    Image("Profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        .shadow(radius: 5)
                    
                    // Change Icon
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                        
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                    }
                    .offset(x: 5, y: 5)
                }
                
                // Name + Username
                VStack(spacing: 6) {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(username)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                
                // Name Field
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name")
                        .font(.headline)
                    TextField("", text: $name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Address")
                        .font(.headline)
                    TextField("", text: $address)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // About Field
                VStack(alignment: .leading, spacing: 6) {
                    Text("About")
                        .font(.headline)
                    TextEditor(text: $about)
                        .frame(height: 80)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
               
                
                
                Button(action: {
                    
                }) {
                    Text("Save Changes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .accessibilityLabel(Text("Save changes to your profile."))
            }
            .padding(.top, 15)
            
            
            Spacer()
        }
    }
}
#Preview{
 EditProfileView()
}
