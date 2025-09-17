import SwiftUI

struct ClassItem: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let schedule: String
    let imageName: String
}

struct TutorClassesView: View {
    let classes = [
        ClassItem(title: "Maths - Grade 11",
                  location: "Gampaha - Montana",
                  schedule: "Saturday/Sunday 1.30 - 3.30pm",
                  imageName: "sampleImage"),
        ClassItem(title: "Maths - Grade 11",
                  location: "Sakya (3rd Floor) - Nugegoda",
                  schedule: "Monday 2.00 - 4.30pm",
                  imageName: "sampleImage"),
        ClassItem(title: "Maths - Grade 11",
                  location: "Gampaha - Montana",
                  schedule: "Saturday/Sunday 1.30 - 3.30pm",
                  imageName: "sampleImage")
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                // Title
                Text("Classes")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                // Class List
                List(classes) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.title)
                                .font(.headline)
                                .bold()
                            Text(item.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(item.schedule)
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 100, height: 60)
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
            }
            
            // Floating Add Button
            Button(action: {
                print("Add new class tapped")
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding()
        }
    }
}

struct TutorClassesView_Previews: PreviewProvider {
    static var previews: some View {
        TutorClassesView()
    }
}
