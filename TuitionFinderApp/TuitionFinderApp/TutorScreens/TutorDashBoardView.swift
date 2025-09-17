import SwiftUI

struct StatCard: View {
    let title: String
    let value: String
    let bgColor: Color
    let textColor: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.footnote)
                .foregroundColor(textColor.opacity(0.8))
                .multilineTextAlignment(.center)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(textColor)
        }
        .frame(maxWidth: .infinity, minHeight: 90)
        .padding()
        .background(bgColor)
        .cornerRadius(12)
    }
}

struct ClassRow: View {
    let title: String
    let views: Int
    let bookmarks: Int
    let inquiries: Int
    let imageName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                
                Text("Views: \(views) | Bookmarks: \(bookmarks) | Inquiries: \(inquiries)")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            Spacer()
            
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 50)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

// DashBoard UI
struct TutorDashBoardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Title and notification icon
            
            HStack {
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .foregroundColor(.gray)
                    .font(.title)
                    .overlay(
                        Circle()
                            .fill(Color.red)
                            .frame(width: 10, height: 10)
                            .offset(x: 8, y: -8),
                        alignment: .topTrailing
                    )
            }
            .padding(.horizontal)
            .padding([.top, .leading, .trailing], 15.0)
            
            // Grid View
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 15),
                                GridItem(.flexible())],
                      spacing: 15) {
                StatCard(title: "Total Classes", value: "12", bgColor: .blue.opacity(0.3), textColor: .blue)
                StatCard(title: "Active Classes", value: "8", bgColor: .green.opacity(0.3), textColor: .green)
                StatCard(title: "Upcoming Classes", value: "7", bgColor: .orange.opacity(0.3), textColor: .orange)
                StatCard(title: "Student Engagement", value: "92%", bgColor: .purple.opacity(0.3), textColor: .purple)
            }
            .padding(.horizontal, 15.0)
            
            // Class Overview
            Text("Class Overview")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 15.0)
            
            ScrollView {
                VStack(spacing: 16) {
                    ClassRow(title: "Maths - Grade 11", views: 150, bookmarks: 30, inquiries: 10, imageName: "MathsImage1")
                    ClassRow(title: "Maths - Grade 10", views: 120, bookmarks: 25, inquiries: 8, imageName: "MathsImage2")
                    ClassRow(title: "Combined Maths - Grade 12", views: 100, bookmarks: 20, inquiries: 5, imageName: "MathsImage3")
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

#Preview {
    TutorDashBoardView()
}
