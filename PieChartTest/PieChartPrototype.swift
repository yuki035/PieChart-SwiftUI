//
//  Pie.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/21.
//

import SwiftUI

struct PieChartPrototype: View {
    private let angle = Angle(degrees: 270.0)
    private let atBats = 89
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.1)
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 30))
                Circle()
                    .trim(from: 0.1, to: 0.14)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 30))
                Circle()
                    .trim(from: 0.14, to: 0.56)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30))
                Circle()
                    .trim(from: 0.56, to: 0.86)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 30))
                Circle()
                    .trim(from: 0.86, to: 1)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 30))
            }
            .frame(width: 100, height: 100)
            .rotationEffect(angle)
            
            VStack {
                Text("\(atBats)")
                    .font(.headline)
                Text("打席")
                    .font(.caption)
            }
        }
    }
}

struct PieChartPrototype_Previews: PreviewProvider {
    static var previews: some View {
        PieChartPrototype()
    }
}
