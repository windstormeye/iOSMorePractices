//
//  ContentView.swift
//  DouBan
//
//  Created by PJHubs on 2019/6/7.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        List {
            ForEach(0...10) { _ in
                Text("2333")
                    .color(Color(red: 145/255, green: 88/255, blue: 9/255))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.orange)
                            .padding(EdgeInsets(top: -5, leading: -5, bottom: -5, trailing: -5))
                    )
            }
        }
        .navigationBarItem(title: Text("豆瓣电影 Top250"))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
