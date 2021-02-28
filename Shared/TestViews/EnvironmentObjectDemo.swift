//
//  EnvironmentObjectDemo.swift
//  Landmarks
//
//  Created by li on 2021/2/28.
//

import SwiftUI

struct EnvironmentObjectDemo: View {
    private var user: User = User()
    var body: some View {
        VStack {
            Text("userName: \(user.name)") // 这不变
            SubView1().environmentObject(user)
            SubView2().environmentObject(user)
            Button("rename") {
                user.name += "b"
            }
        }

    }
}

struct SubView1: View {
    @EnvironmentObject var a:User
    @EnvironmentObject var b:User
    var body: some View {
        Text("a name \(a.name)")
        Text("b name \(b.name)")
    }
}

struct SubView2: View {
    @EnvironmentObject var user:User
    var body: some View {
        Text("name \(user.name)")
    }
}

class User: ObservableObject {
    @Published var name = "Sunny"
}

struct EnvironmentObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectDemo()
    }
}
