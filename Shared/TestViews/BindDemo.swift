//
//  BindDemo.swift
//  Landmarks
//
//  Created by li on 2021/2/28.
//

import SwiftUI

struct BindDemo: View {
    @State var date: String = Date().description
    @State private var total:Int = 0
    var body: some View {
        print("mainView")

        return VStack {
           Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
          
           SubView(date: $date, total: $total)
           Button("修改日期") {
               self.total += 1
               self.date = Date().description
           }
       }
    }
}

struct SubView: View {
    @Binding var date: String
    @Binding var total: Int
    var body: some View {
        print("subView")
        return VStack{
            Text(date)
            Text("total: \(total)")
        }
    }
}

struct BindDemo_Previews: PreviewProvider {
    static var previews: some View {
        BindDemo()
    }
}
/*
 Binding是数据的一级引用，在SwiftUI中作为数据（状态）双向绑定的桥梁，允许在不拥有数据的情况下对数据进行读写操作。我们可以绑定到多种类型，包括 State ObservedObject 等，甚至还可以绑定到另一个Binding上面。Binding本身就是一个Getter和Setter的封装。
 */
