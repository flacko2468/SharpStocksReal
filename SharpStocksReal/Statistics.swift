//
//  Statistics.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import SwiftUI

class Statistics: ObservableObject {
    
    @ObservedObject var model: Model
    
    @Published var tickerToData: [String: [Double]] = [:]
    var editedDates: ArraySlice<String> = []
    
    
    init(model: Model) {
        self.model = model
        syncData(tickers: model.stocks)
    }
    
    func syncData(tickers: [String]) {
        var lowestDate: String = "1000-00-00"
        var highestDate: String = "3000-00-00"
        var dictionaries: [String:[String: Double]] = [:]
        let myGroup = DispatchGroup()
        
        for ticker in tickers {
            myGroup.enter()
            var graphingData: [String: Double] = [:]
            if let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\(ticker)&outputsize=full&apikey=43R82LF2N3EKUU66") {
               URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    print("nice")
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(DemoData.self, from: data)
                        for (date, prices) in parsedJSON.dates {
                            graphingData[date] = Double(prices["4. close"]!)
                        }
                        dictionaries[ticker] = graphingData
                        myGroup.leave()
                    }
                    catch {
                        print(error)
                    }
                }
               }.resume()
            }
        }
        myGroup.notify(queue: .main) {
            for (_, data) in dictionaries {
                let dates = Array(data.keys.sorted())
                if dates[0] > lowestDate {
                    lowestDate = dates[0]
                }
                if dates.last! < highestDate {
                    highestDate = dates.last!
                }
            }
            let dates = Array(dictionaries[tickers[0]]!.keys.sorted())
            self.editedDates = dates[dates.firstIndex(of: lowestDate)!...dates.firstIndex(of: highestDate)!]
            for ticker in tickers {
                self.tickerToData[ticker] = []
                for date in self.editedDates {
                    self.tickerToData[ticker]!.append(dictionaries[ticker]![date]! / dictionaries[ticker]![self.editedDates[0]]!)
                }
            }
        }
    }
    
    func getReturnsWith(allocations: [String : Double]) -> [Double] {
        var result: [Double] = []
        for index in 0..<editedDates.count {
            var returnsCount = Double(0)
            for ticker in tickerToData.keys {
                returnsCount += tickerToData[ticker]![index] * allocations[ticker]!
            }
            result.append(returnsCount)
        }
        return result
    }
    
    
    
}

struct DemoData: Codable {
    enum CodingKeys: String, CodingKey {
            case dates = "Time Series (Daily)"
        }
    let dates: [String:[String:String]]
}


