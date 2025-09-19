
import SwiftUI

struct TutorMainScreenView: View {
    var body: some View {
        //NavigationStack{
            
            
            
            TabView{
                
                TutorDashBoardView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                
                TutorClassesView()
                
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Classes")
                    }
                
                TutorSheduleView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Schedules")
                    }
                
                TutorProfileView()
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "person.circle")
                    }
                
            }
        }
    }
//}

#Preview {
    TutorMainScreenView()
}
