//
//  MainView.swift
//  TuitionFinderApp
//
//  Created by Hashani Ranawake on 2025-09-14.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        //NavigationStack{
            
            
            
            TabView{
                
                HomeView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                
                MapView()
                
                    .tabItem {
                        Text("Map")
                        Image(systemName: "map")
                    }
                
                BookmarksView()
                    .tabItem {
                        Text("Bookmarks")
                        Image(systemName: "bookmark")
                    }
                
                ProfileView()
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "person.circle")
                    }
                
            }
        }
    }
//}

#Preview {
    MainView()
}
