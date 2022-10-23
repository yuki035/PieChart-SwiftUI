//
//  ViewModel.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/22.
//

import SwiftUI

class PieChartViewModel: ObservableObject {
    
    @Published var PieChartDatas: [PieChartModel] = []
    @Published var plateApperances: Int = 0
    
    init(sumArray: [Int]) {
        setup(sumArray: sumArray)
    }
    
    func setup(sumArray: [Int]) {
        plateApperances = sum(array: sumArray)
        let ratioArray = calcRatioArray(sumArray: sumArray, sum: plateApperances)
        let fromToArray = calcFromTo(ratioArray: ratioArray)
        setupPieChartDatas(fromToArray: fromToArray)
    }
    
}
// MARK: Functions for setup
private extension PieChartViewModel {
    
    func sum(array: [Int]) -> Int {
        return array.reduce(0, +)
    }
    
    /// 要素の合計値に対する各要素の割合を配列として返す
    /// - Parameter sumArray: BatAreaに打った合計値をそれぞれ保持した配列
    /// - Returns: 各要素の割合を保持した配列
    func calcRatioArray(sumArray: [Int], sum: Int) -> [CGFloat] {
        
        var cumulativeSumArray: [Int] = Array(repeating : 0, count : sumArray.count+1)
        var ratioArray: [CGFloat] = []
        
        // 累積和を計算
        for i in 0..<sumArray.count {
            cumulativeSumArray[i+1] = cumulativeSumArray[i] + sumArray[i]
        }
        
        ratioArray = cumulativeSumArray.map { CGFloat($0) / CGFloat(sum) }
        
        return ratioArray
    }
    
    /// 円グラフの描画に必要な(from, to)の配列を返す
    /// - Parameter ratioArray:　要素の合計値に対する各要素の割合を保持する配列
    /// - Returns: 円グラフの描画に必要なタプルの配列
    func calcFromTo(ratioArray: [CGFloat]) -> [(from: CGFloat, to: CGFloat)]{
        
        var fromToArray: [(from: CGFloat, to: CGFloat)] = []
        
        for i in 0..<ratioArray.count-1 {
            fromToArray.append((from: ratioArray[i], to: ratioArray[i+1]))
        }
        
        return fromToArray
    }
    
    /// PieChartDatasに値を与える
    /// - Parameter fromToArray: 円グラフの描画に必要なタプルの配列
    func setupPieChartDatas(fromToArray: [(from: CGFloat, to: CGFloat)]) {
        var i = 0
        for batArea in PieChartModel.BatAreas.allCases {
            let data = PieChartModel(batArea: batArea, from: fromToArray[i].from, to: fromToArray[i].to)
            PieChartDatas.append(data)
            i+=1
        }
    }
    
}
