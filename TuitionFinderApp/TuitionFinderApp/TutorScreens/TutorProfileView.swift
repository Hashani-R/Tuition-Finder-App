import SwiftUI

struct TutorProfileView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Profile")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            
            HStack {
                Spacer()
                Button(action: {
                    print("Settings tapped")
                }) {
                    
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            
            VStack(spacing: 12) {
                Image("TutorImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    //.padding(.top, 0.0)
                
                Text("Ruwan de Silva")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .bold()
                
                Text("Tutor")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
                
            }
            .padding(.vertical, 20)
            
            // MARK: - Account Section
            VStack(alignment: .leading, spacing: 0) {
                Text("Account")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                ProfileRow(title: "Personal Information")
                ProfileRow(title: "Institute Information")
            }
            .padding(.bottom, 24)
            
            // MARK: - Manage Section
            VStack(alignment: .leading, spacing: 0) {
                Text("Manage")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                ProfileRow(title: "Settings", icon: "gearshape.fill")
                ProfileRow(title: "Notifications", icon: "bell.fill")
                ProfileRow(title: "Help Center", icon: "questionmark.circle.fill")
                ProfileRow(title: "Logout", icon: "power")
            }
            
            Spacer()
        }
        .padding(.top, 20.0)
    }
}

// MARK: - Profile Row Component
struct ProfileRow: View {
    var title: String
    var icon: String? = nil
    
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .frame(width: 28, height: 28)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Text(title)
                .font(.body)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.1)),
            alignment: .bottom
        )
    }
}

#Preview {
    TutorProfileView()
}
