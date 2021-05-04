//
//  ContentView.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import SwiftUI
// "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\(ticker)&outputsize=full&apikey=43R82LF2N3EKUU66"
import Combine
import SwiftUICharts

struct StatisticsView: View {
    @ObservedObject var stats: Statistics
    
    
    
    var body: some View {
        
        MultiLineChartView(data: [(stats.getReturnsWith(allocations: ["TSLA":0.33, "IBM":0.33, "AAPL":0.33]), GradientColors.green), (stats.getReturnsWith(allocations: ["TSLA":0.8, "IBM":0.2, "AAPL":0]), GradientColors.purple)], title: "Nice")
        
            
    }
    
    
//    func getStock(with ticker: String) {
//
//        var graphingData: [String: Double] = [:]
//        if let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=demo") {
//           URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                let jsonDecoder = JSONDecoder()
//                do {
//                    let parsedJSON = try jsonDecoder.decode(DemoData.self, from: data)
//                    for (date, prices) in parsedJSON.dates {
//                        graphingData[date] = Double(prices["4. close"]!)
//                    }
//                    let sortedKeys = Array(graphingData.keys.sorted())
//                    for key in sortedKeys {
//                        result.append(graphingData[key]!)
//                    }
//
//                }
//                catch {
//                    print(error)
//                }
//            }
//           }.resume()
//        }
//    }
        
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView()
//    }
//}



