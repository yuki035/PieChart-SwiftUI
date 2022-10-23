//
//  PieChartWholeView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/22.
//

import SwiftUI

struct PieChartWholeView: View {
    
    @ObservedObject var viewModel: PieChartViewModel
    
    init(sumArray: [Int]) {
        viewModel = PieChartViewModel(sumArray: sumArray)
    }
    
    var body: some View {
        HStack(spacing: 36) {
            PieChartView(viewModel: viewModel)
                .padding()
            VStack(alignment: .leading,spacing: 5) {
                ForEach(viewModel.PieChartDatas) { data in
                    HStack {
                        Text("■").foregroundColor(data.batArea.color())
                        Text(data.batArea.toString())
                        Spacer()
                        Text(String(format: "%.1f", data.ratio)+"%")
                    }
                    .font(.footnote)
                    .frame(width: 120)
                }
            }
        }
        .padding(.vertical)
        .frame(width:UIScreen.main.bounds.width*0.90)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct PieChartWholeView_Previews: PreviewProvider {
    static var previews: some View {
        let testSumArray = [3, 2, 23, 12, 20]
        PieChartWholeView(sumArray: testSumArray)
    }
}
