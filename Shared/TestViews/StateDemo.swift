//
//  StateDemo.swift
//  Landmarks
//
//  Created by li on 2021/2/28.
//

import SwiftUI

/*
 加了@State注解的变量，视图通过监视和读取该变量来重新渲染UI。
 @State只能用于当前视图，并且其对应的数据类型为值类型（如果非要对应引用类型的话则必须在每次赋值时重新创建新的实例才可以）
 */
struct StateDemo: View {
    // State针对具体View的内部变量进行管理，不应该从外部被允许访问，所以应该标记为private
    @State private var name: String = ""
    @State private var count: Int = 0
    var body: some View {
        VStack {
            Text("count \(count)")
            Button("add one") {
                count += 1
            }
            Text("name \(name)")
            // 如果是读写都有，引用属性需要$开头
            TextField("enter name", text: $name)
        }
    }
}

struct StateDemo_Previews: PreviewProvider {
    static var previews: some View {
        StateDemo()
    }
}
