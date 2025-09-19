import SwiftUI

struct ProfileView: View {
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
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
                        
                       // Navigation for settings tab
                        NavigationLink(destination: SettingsView()) {
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
                        }
                        
                        
                        // Navigation for notification tab
                        NavigationLink(destination: NotificationSettings()) {
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
                        }
                        
                        // Navigation for payment methods
                        NavigationLink(destination: EditProfileView()) {
                            HStack {
                                Image(systemName: "pencil")
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                    .frame(width: 30)
                                Text("Edit Profile")
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
                        
                      
                        
                        //Navigation for enrolled classs
                        NavigationLink(destination: EnrolledClassesView()) {
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
                        }
                        
                        // Navigation for Help Centr
                        NavigationLink(destination: HelpCenterView()) {
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
                        }
                        
                        // Logout
                        Button(action: {
                            isLoggedOut = true
                        }) {
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
                        // Navigation to Login screen after logout
                        .navigationDestination(isPresented: $isLoggedOut) {
                            LoginView()
                        }
                        
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
}

// destination views
struct SettingView: View {
    var body: some View { }
}

struct NotificationsSettings: View {
    var body: some View { }
}

struct Profile: View {
    var body: some View { }
}

struct EnrolledClassesView: View {
    var body: some View { Text("Enrolled Classes Page").font(.body).padding() }
}
struct HelpCenterView: View {
    var body: some View { Text("Help Center Page").font(.body).padding() }
}

//  Login screen (for after logout)
struct LognView: View {
    var body: some View {
        VStack {
            Text("Login Screen")
                .font(.largeTitle)
                .padding()
            Text("User logged out. Please log in again.")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProfileView()
}
