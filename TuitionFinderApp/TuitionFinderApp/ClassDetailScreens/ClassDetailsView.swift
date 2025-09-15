import SwiftUI

struct ClassDetailsView: View {
    @State private var selectedTab = "About"
    @State private var showDescription = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
                // MARK: Top Section
                VStack(spacing: 8) {
                    Text("Class Details")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    ZStack(alignment: .topTrailing) {
                        Image("TuitionClass")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 160)
                            .cornerRadius(12)
                            .clipped()
                            .padding(.horizontal)
                        
                        Button(action: {
                            // Bookmark action
                        }) {
                            Image(systemName: "bookmark")
                                .font(.title2)
                                .padding(5)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Rectangle())
                        }
                        .padding(.trailing)
                    }
                    
                    // Class + Tutor Info
                    VStack(alignment: .leading) {
                        Text("Maths – SyZyGy")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Tutor: Dr. Emily Perera")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
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
                            Text("This is a simple description about the tutor or the class. It can be expanded when the arrow is tapped.")
                                .font(.callout)
                                .foregroundColor(.black)
                                .transition(.opacity)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Tabs
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
                }
                
                // MARK: Dynamic Bottom Content
                VStack(alignment: .leading, spacing: 12) {
                    if selectedTab == "About" {
                        AboutView()
                    } else if selectedTab == "Reviews" {
                        ReviewsView()
                    } else if selectedTab == "Contact" {
                        ContactView()
                    }
                }
                .padding(.horizontal)
                
                // MARK: Enroll Button
                Button(action: {
                    // Enroll action
                }) {
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
                .padding(.vertical, 20) // extra bottom padding so button is fully visible
            }
        }
    }
}

// MARK: Subviews for each tab

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Grade + Medium in one row
            HStack(spacing: 16) {
                HStack {
                    Image(systemName: "graduationcap")
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Grade")
                            .font(.subheadline).fontWeight(.medium)
                        Text("Grade 10")
                            .font(.footnote).foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                HStack {
                    Image(systemName: "book")
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Medium")
                            .font(.subheadline).fontWeight(.medium)
                        Text("English Medium")
                            .font(.footnote).foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            
            // Schedule
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                    Text("Days: Mon, Wed, Fri")
                        .font(.subheadline)
                }
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text("Time: 10:00 AM - 11:30 AM")
                        .font(.subheadline)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
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
            
            // Fees
            HStack {
                Image(systemName: "indianrupeesign.circle")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Fees")
                        .font(.subheadline).fontWeight(.medium)
                    Text("Rs. 5,000 per month")
                        .font(.footnote).foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

struct ReviewsView: View {
    var body: some View {
        VStack {
            Text("Reviews content will go here")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ContactView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Phone")
                        .font(.subheadline).fontWeight(.medium)
                    Text("+94 77 123 4567")
                        .font(.footnote).foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.subheadline).fontWeight(.medium)
                    Text("emilyperera@example.com")
                        .font(.footnote).foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            HStack {
                Image(systemName: "message.fill")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Message")
                        .font(.subheadline).fontWeight(.medium)
                    Text("Tap to send a message")
                        .font(.footnote).foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

#Preview {
    ClassDetailsView()
}
