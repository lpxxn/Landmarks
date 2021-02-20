//
//  PublishedDemo.swift
//  Landmarks
//
//  Created by li on 2021/2/20.
//

import SwiftUI

struct PublishedDemo: View {
    @ObservedObject var viewModelT = DataViewModelT1()
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("count: \(viewModelT.value)")
            self.$viewModelT.isOn.wrappedValue ? Text("on") : Text("off")
            Toggle(isOn: self.$viewModelT.isOn, label: {
                /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
            }).fixedSize()
        }
    }
}

class DataViewModelT1: ObservableObject {
    @Published var value: Int = 0
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

/*
 @Published是SwiftUI最有用的包装之一，允许我们创建出能够被自动观察的对象属性，SwiftUI会自动监视这个属性，一旦发生了改变，会自动修改与该属性绑定的界面。
 
 @ObservedObject告诉SwiftUI，这个对象是可以被观察的，里面含有被@Published包装了的属性。
 @ObservedObject包装的对象，必须遵循ObservableObject协议。也就是说必须是class对象，不能是struct。
 @ObservedObject允许外部进行访问和修改。

 */

struct PublishedDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PublishedDemo()
        }
    }
}
