//
//  ContentView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/21.
//

import SwiftUI

struct ContentView: View {
    let normalBackgroundColor = Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1))
    var body: some View {
        ScrollView {
            Spacer().frame(height: 300)
            HStack(spacing: 40) {
                PieChartPrototype()
                    .padding()
                HStack(){
                    VStack(alignment: .leading, spacing: 5) {
                        Text("■　").foregroundColor(.red)+Text("投手")
                        Text("■　").foregroundColor(.blue)+Text("捕手")
                        Text("■　").foregroundColor(.yellow)+Text("内野")
                        Text("■　").foregroundColor(.green)+Text("外野")
                        Text("■　").foregroundColor(.gray)+Text("その他")
                    }
                    VStack(spacing: 5) {
                        Text("14.3%")
                        Text("14.3%")
                        Text("14.3%")
                        Text("14.3%")
                        Text("14.3%")
                    }
                }
                .font(.footnote)

            }
            .padding()
            .frame(width: 350)
            .background()
            .cornerRadius(15)
        }
        .frame(width: 466.0)
        .background(normalBackgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
