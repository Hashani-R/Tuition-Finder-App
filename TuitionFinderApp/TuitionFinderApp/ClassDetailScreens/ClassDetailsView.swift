import SwiftUI

// MARK: - Review Model
struct Review: Identifiable {
    let id = UUID()
    let userName: String
    let userImage: String
    let rating: Int
    let timeAgo: String
    let comment: String
    let likes: Int
    let replies: Int
}

let demoReviews: [Review] = [
    Review(
        userName: "Sophia Bennett",
        userImage: "user1",
        rating: 5,
        timeAgo: "2 weeks ago",
        comment: "Dr. Carter’s calculus class is exceptional! Her teaching style is clear, and she makes complex topics easy to understand. Highly recommend!",
        likes: 15,
        replies: 2
    ),
    Review(
        userName: "Liam Harper",
        userImage: "user2",
        rating: 4,
        timeAgo: "1 month ago",
        comment: "The class is well-structured and the instructor is knowledgeable. However, the pace can be a bit fast for beginners.",
        likes: 8,
        replies: 1
    )
]

// MARK: - Main ClassDetailsView
struct ClassDetailsView: View {
    @State private var selectedTab = "About"
    @State private var showDescription = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
                // Top Title
                Text("Class Details")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)

                // Banner Image + Bookmark
                ZStack(alignment: .topTrailing) {
                    Image("TuitionClass")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .clipped()

                    Button(action: {
                        // Bookmark action
                    }) {
                        Image(systemName: "bookmark")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(6)
                            .background(Color.white.opacity(0.8))
                            .clipShape(Rectangle())
                    }
                }

                // Three Tabs
                HStack {
                    ForEach(["About", "Reviews", "Contact"], id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(selectedTab == tab ? .blue : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedTab == tab ? Color.blue.opacity(0.1) : Color.clear)
                                )
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal)

                // Class and Tutor Dtail
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Maths – SyZyGy")
                        .font(.title3)
                        .fontWeight(.bold)

                    HStack {
                        Text("Tutor: Ms. Emily Perera")
                            .font(.body)
                            .foregroundColor(.black.opacity(0.7))
                            .fontWeight(.medium)

                        Button(action: {
                            withAnimation {
                                showDescription.toggle()
                            }
                        }) {
                            Image(systemName: showDescription ? "chevron.up" : "chevron.down")
                                .foregroundColor(.gray)
                        }
                    }

                    if showDescription {
                        Text("Ms. Emily Perera, a O/L Mathematics teacher with 12+ years of experience, has taught in reputed schools in Colombo. She is dedicated to helping students excel through effective teaching methods.")
                            .font(.callout)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .transition(.opacity)
                    }
                }
                .padding(.horizontal)

                // Bottom Content and three tabs
                if selectedTab == "About" {
                    AboutTabView()
                } else if selectedTab == "Reviews" {
                    ReviewsTabView()
                } else if selectedTab == "Contact" {
                    ContactTabView()
                }
            }
        }
    }
}

// About Tab and C
struct AboutTabView: View {
    var body: some View {
        VStack(spacing: 12) {
            
            // Grade and medium row
            HStack {
                Image(systemName: "graduationcap")
                    .foregroundColor(.blue)
                Text("Grade 10")
                    .font(.subheadline).fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "book")
                    .foregroundColor(.blue)
                VStack(alignment: .leading){
                    Text("English Medium")
                        .font(.subheadline).fontWeight(.medium)
                }
                    Spacer()
                }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Schedule row
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                    Text("Days: Mon, Wed, Fri")
                        .font(.subheadline).fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text("Time: 10:00 AM - 11:30 AM")
                        .font(.subheadline).fontWeight(.medium)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Location
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Address")
                        .font(.subheadline).fontWeight(.medium)
                    Text("Miriswatta Rd, Gampaha")
                        .font(.footnote).foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Fees
            HStack {
                Image(systemName: "indianrupeesign.circle")
                    .foregroundColor(.blue)
                Text("Rs. 5,000 per month")
                    .font(.subheadline).fontWeight(.medium)
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Enroll
            Button(action: {}) {
                Text("Enroll")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}

// MARK: - Reviews Tab
struct ReviewsTabView: View {
    let reviews: [Review] = demoReviews
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("4.8")
                            .font(.system(size: 40, weight: .bold))
                        HStack {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        Text("125 reviews")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        RatingBar(stars: 5, percent: 70)
                        RatingBar(stars: 4, percent: 20)
                        RatingBar(stars: 3, percent: 5)
                        RatingBar(stars: 2, percent: 3)
                        RatingBar(stars: 1, percent: 2)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            ForEach(reviews) { review in
                ReviewCard(review: review)
                    .padding(.horizontal)
            }
            
            Button(action: {}) {
                Text("Enroll")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
        }
    }
}

// MARK: - Contact Tab
struct ContactTabView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text("+94 71 234 5678")
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                Text("emily.perera@example.com")
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            HStack {
                Image(systemName: "message.fill")
                    .foregroundColor(.blue)
                Text("Send a message")
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            Button(action: {}) {
                Text("Enroll")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}

// MARK: - Review Helpers
struct RatingBar: View {
    let stars: Int
    let percent: Int
    
    var body: some View {
        HStack {
            Text("\(stars)")
                .font(.footnote)
            ProgressView(value: Float(percent), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .frame(width: 120)
            Text("\(percent)%")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(review.userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(review.userName)
                        .font(.subheadline).bold()
                    Text(review.timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            HStack(spacing: 2) {
                ForEach(0..<5) { index in
                    Image(systemName: index < review.rating ? "star.fill" : "star")
                        .foregroundColor(index < review.rating ? .blue : .gray.opacity(0.5))
                }
            }
            .font(.caption)
            
            Text(review.comment)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            HStack(spacing: 20) {
                Label("\(review.likes)", systemImage: "hand.thumbsup")
                Label("\(review.replies)", systemImage: "bubble.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    ClassDetailsView()
}

