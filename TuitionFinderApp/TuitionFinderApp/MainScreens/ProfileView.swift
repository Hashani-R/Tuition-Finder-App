import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10.0)
                    .padding(.top, 20.0)
                
                Image("Profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    .padding(.top, 10)
                
                Text("Nishadi Gamage")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Student")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 12.0) {
                    Text("  Manage")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 25.0)
                    
                    // SettingsTab 
                    HStack {
                        Image(systemName: "gearshape")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text("Settings")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                    
                    // Payment Methods
                    HStack {
                        Image(systemName: "creditcard")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text("Payment Methods")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                    
                    // Notifications
                    HStack {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text("Notifications")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                    
                    // Enrolled Classes
                    HStack {
                        Image(systemName: "book.closed")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text("Enrolled Classes")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                    
                    // Help Center
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text("Help Center")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                    
                    // Logout
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .font(.title3)
                            .foregroundColor(.red)
                            .frame(width: 30)
                        
                        Text("Logout")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
                }
                .background(Color.clear)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 1)
                .padding(.horizontal, 10)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ProfileView()
}
