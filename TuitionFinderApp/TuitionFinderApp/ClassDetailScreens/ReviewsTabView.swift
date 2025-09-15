import SwiftUI

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

struct ReviewsTabView: View {
    let reviews: [Review] = demoReviews
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Maths – SyZyGy")
                    .font(.title3).bold()
                    .padding(.horizontal)
                
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
        .navigationTitle("Class Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

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

struct ReviewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReviewsTabView()
        }
    }
}




#Preview {
    ReviewsTabView()
}
