
import SwiftUI

struct Tabbar: View {
    @State var selectedTab = "Home"
    
    let tabs = [
        ["name": "Home", "icon": "house"],
        ["name": "Calendar", "icon": "calendar"],
        ["name": "Chat", "icon": "message"],
        ["name": "Profile", "icon": "person"]
    ]
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                DoctorListView()
                    .tag("Home")
                
                Text("Nanana")
                    .tag("Calendar")
                
                Text("Nanana")
                    .tag("Chat")
                
                Text("Nanana")
                    .tag("Profile")
            }
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Spacer()
                    TabbarItem(tab: tab["icon"] ?? "", title: tab["name"] ?? "", selected: $selectedTab)
                    Spacer()
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 5)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(.backgroundPrimary)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black.opacity(0.04)),
                alignment: .top
            )
        }
    }
}


#Preview {
    Tabbar()
}
