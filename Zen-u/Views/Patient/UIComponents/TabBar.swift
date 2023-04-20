//
//  TabBar.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 18/04/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Text("Home")
                .tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            Text("Appointment")
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Appointment")
                }
            Text("Records")
                .tabItem{
                    Image(systemName: "doc")
                    Text("Records")
                }
            Text("Reminders").tabItem{
                Image(systemName: "bell")
                Text("Reminders")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


