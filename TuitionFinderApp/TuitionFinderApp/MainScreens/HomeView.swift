import SwiftUI

struct PopularClass: Identifiable {
    let id = UUID()
    let subject: String
    let teacher: String
    let imageName: String
    let rating: Int
}

let popularClasses = [
    PopularClass(subject: "Sinhala", teacher: "Mr. Demian Silva", imageName: "classroom1", rating: 4),
    PopularClass(subject: "Maths", teacher: "Mr. S. Adikari", imageName: "classroom2", rating: 5),
    PopularClass(subject: "Scholarship", teacher: "Mrs. Hayesika", imageName: "classroom3", rating: 3)
]

struct HomeView: View {
    var body: some View {
        
       // NavigationStack {
            
       
            VStack(alignment: .leading, spacing: 22.0) {
                
                HStack {
                    Text("Find a Class")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "bell.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                
                .padding(.horizontal)
                .padding(.top)
                
                HStack {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                    
                    Text("Search for classes")
                        .foregroundColor(.gray)
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .foregroundColor(.gray)
                }
                
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                //Spacer()
                
                Image("Banner2")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 145)
                    .cornerRadius(13)
                    .padding(.horizontal)
                    .clipped()
                
                //Spacer()
                //.padding(.bottom)
                //Spacer()
                
                Text("Select a category")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .padding(.bottom, 05)
                
                //Spacer()
                //.padding(.bottom)
                
                
                //Filter Buttons
                
                
                HStack(spacing: 25) {
                    ForEach(["Grade 05", "O/Level", "A/Level"], id: \.self) { category in
                        Button(action: {
                            print("\(category) tapped")
                        }) {
                            Text(category)
                                .font(.body)
                                .foregroundColor(.black)
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                
                HStack(spacing: 30) {
                    ForEach(["Sinhala Medium", "English Medium"], id: \.self) { category in
                        Button(action: {
                            print("\(category) tapped")
                        }) {
                            Text(category)
                                .font(.body)
                                .foregroundColor(.black)
                                .padding(.vertical, 8)
                                .frame(minWidth: 150)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom,0)
                //.padding(.top, 5)
                
                //Spacer()
                Text("Popular Classes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .padding(.top,07)
                    .padding(.bottom, 05)
                
                Spacer()
                    .padding(.bottom)
                
                //—- Popular Classes Horizontal Scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(popularClasses) { classItem in
                            VStack(alignment: .leading, spacing: 0) {
                                Image(classItem.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 100)
                                    .cornerRadius(12)
                                    .clipped()
                                
                                Text(classItem.subject)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text(classItem.teacher)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                // Ratings
                                HStack(spacing: 2) {
                                    ForEach(0..<5) { index in
                                        Image(systemName: index < classItem.rating ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            .frame(width: 150)
                        }
                    }
                    .padding(.horizontal,5)
                }
                
                // Spacer()
                //.padding(.bottom)
                
                
                
                
                
                
                
            }
        }
        
    }
//}

#Preview {
    HomeView()
}

                
