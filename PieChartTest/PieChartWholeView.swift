//
//  PieChartWholeView.swift
//  PieChartTest
//
//  Created by 森祐樹 on 2022/10/22.
//

import SwiftUI

struct PieChartWholeView: View {
    var body: some View {
        HStack(spacing: 40) {
            PieChartView()
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
}

struct PieChartWholeView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartWholeView()
    }
}
