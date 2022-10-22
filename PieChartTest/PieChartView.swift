//
//  PieChartView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/21.
//

import SwiftUI




struct PieChartView: View {
    private let angle = Angle(degrees: -90)
    private let atBats = 89
    @ObservedObject var viewModel = PieChartViewModel()

    var body: some View {
        ZStack {
            ZStack {
                ForEach(viewModel.PieChartDatas) { data in
                    Circle()
                        .trim(from: data.from, to: data.to)
                        .stroke(data.batArea.color(), style: StrokeStyle(lineWidth: 30))
                }
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

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
