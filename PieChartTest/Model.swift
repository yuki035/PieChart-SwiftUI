//
//  Model.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/22.
//

import SwiftUI

struct PieChartModel: Identifiable, Equatable {
    let id = UUID(),
        batArea: BatAreas,
        from: CGFloat,
        to: CGFloat
    
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

}

