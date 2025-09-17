import SwiftUI

struct TutorSheduleView: View {
    @State private var selectedTab: String = "Calendar"
    @State private var events: [EventItem] = [
        EventItem(title: "Mathematics", time: "8:00 AM - 10:00 AM", icon: "calendar"),
        EventItem(title: "Physics", time: "10:30 AM - 12:30 PM", icon: "book")
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            VStack(alignment: .leading) {
                // MARK: - Header
                HStack {
                    Text("Schedule")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // MARK: - Tabs
                HStack {
                    Button(action: { selectedTab = "Calendar" }) {
                        Text("Calendar")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(selectedTab == "Calendar" ? .blue : .gray) // 🔑 color change
                    }
                    
                    Spacer()
                    
                    Button(action: { selectedTab = "List" }) {
                        Text("List")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(selectedTab == "List" ? .blue : .gray) // 🔑 color change
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // Calender and List tabs
                if selectedTab == "Calendar" {
                    CalendarTabView(events: events)
                } else {
                    ListTabView(events: events)
                }
                
                Spacer()
            }
            
            //Add Button
            AddButton {
                print("Add Reminder tapped")
            }
            .padding()
        }
    }
}


struct AddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
    }
}

// MARK: - Calendar Tab
struct CalendarTabView: View {
    var events: [EventItem]
    
    var body: some View {
        VStack {
            Text("October 2024")
                .font(.headline)
                .padding(.vertical, 10)
            
            // Calendar Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(1..<32) { day in
                    Text("\(day)")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(day == 5 ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            // Coming Events
            VStack(alignment: .leading, spacing: 16) {
                Text("Coming Events")
                    .font(.headline)
                    .padding(.horizontal)
                
                ForEach(events) { event in
                    EventCard(title: event.title, time: event.time, icon: event.icon)
                }
            }
            .padding(.top)
        }
    }
}

//List tab
struct ListTabView: View {
    var events: [EventItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Events")
                .font(.headline)
                .padding()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(events) { event in
                        EventCard(title: event.title, time: event.time, icon: event.icon)
                    }
                }
            }
        }
    }
}


struct EventCard: View {
    var title: String
    var time: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30, height: 30)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(time).font(.caption).foregroundColor(.blue)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

// MARK: - Event Model
struct EventItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let icon: String
}

#Preview {
    TutorSheduleView()
}
