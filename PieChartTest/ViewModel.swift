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
        let fromToArray = calcFromTo(sumArray: sumValues)
        var i = 0
        for batArea in PieChartModel.BatAreas.allCases {
            PieChartDatas.append(PieChartModel(batArea: batArea,
                                               from: fromToArray[i].from,
                                               to: fromToArray[i].to))
            i+=1
        }
    }
    
    // 引数：[P.sum, C.sum, I.sum, Out.sum, Other.sum]
    // 円グラフの描画に必要な(from, to)の配列を返す
    func calcFromTo(sumArray: [Int]) -> [(from: CGFloat, to: CGFloat)]{
        
        let sum: Int = sumArray.reduce(0, +)
        var s: [Int] = [0, 0, 0, 0 ,0 ,0]
        var ratioArray: [CGFloat] = []
        var ret: [(from: CGFloat, to: CGFloat)] = []
        
        // 累積和を計算
        for i in 0..<sumArray.count {
            s[i+1] = s[i] + sumArray[i]
        }
        
        ratioArray = s.map { CGFloat($0) / CGFloat(sum) }
        
        for i in 0..<s.count-1 {
            ret.append((from: ratioArray[i], to: ratioArray[i+1]))
        }
        
        return ret
    }
    
}

let sumValues = [3, 2, 23, 12, 20]
