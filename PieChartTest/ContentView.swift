//
//  ContentView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/21.
//

import SwiftUI

struct ContentView: View {
    let testSumArray = [3, 2, 23, 12, 20]
    let normalBackgroundColor = Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1))
    var body: some View {
        ScrollView {
            Spacer().frame(height: 300)
            PieChartWholeView(sumArray: testSumArray)
        }
        .frame(maxWidth: .infinity)
        .background(normalBackgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
