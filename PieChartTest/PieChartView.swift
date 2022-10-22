//
//  PieChartView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/21.
//

import SwiftUI

enum BatAreas {

    case Pitcher
    case Catcher
    case Infielder
    case Outfielder
    case Other
    
    func color() -> Color {
        switch self {
        case .Pitcher:
            return .red
        case .Catcher:
            return .blue
        case .Infielder:
            return .yellow
        case .Outfielder:
            return .green
        case .Other:
            return .gray
        }
    }
    
    func toString() -> String {
        switch self {
        case .Pitcher:
            return "投手"
        case .Catcher:
            return "捕手"
        case .Infielder:
            return "内野"
        case .Outfielder:
            return "外野"
        case .Other:
            return "その他"
        }
    }

}

struct PieChartInfo: Identifiable, Equatable {
    let id    = UUID(),
        batArea: BatAreas,
        from : CGFloat,
        to: CGFloat
}

struct PieChartView: View {
    private let angle = Angle(degrees: 270.0)
    private let atBats = 89
    var datas = [PieChartInfo(batArea: .Pitcher, from: 0, to: 0.1),
                 PieChartInfo(batArea: .Catcher, from: 0.1, to: 0.14),
                 PieChartInfo(batArea: .Infielder, from: 0.14, to: 0.56),
                 PieChartInfo(batArea: .Outfielder, from: 0.56, to: 0.86),
                 PieChartInfo(batArea: .Other, from: 0.86, to: 1)]
    
    init() {
    }
    var body: some View {
        ZStack {
            ZStack {
                ForEach(datas) { data in
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
