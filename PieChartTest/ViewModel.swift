//
//  ViewModel.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/22.
//

import SwiftUI

class PieChartViewModel: ObservableObject {
    @Published var PieChartDatas: [PieChartModel] = []
    
    init() {
        setupPieChartDatas()
    }
    
    func setupPieChartDatas() {
        PieChartDatas = datas
    }
    
}

let datas = [PieChartModel(batArea: .Pitcher, from: 0, to: 0.1),
             PieChartModel(batArea: .Catcher, from: 0.1, to: 0.14),
             PieChartModel(batArea: .Infielder, from: 0.14, to: 0.56),
             PieChartModel(batArea: .Outfielder, from: 0.56, to: 0.86),
             PieChartModel(batArea: .Other, from: 0.86, to: 1)]
