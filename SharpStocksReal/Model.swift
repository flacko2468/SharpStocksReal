//
//  Model.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import Foundation

class Model: ObservableObject {

    var stocks: [String] = ["TSLA", "IBM", "AAPL"]


    func addStock(ticker: String) {
        if !stocks.contains(ticker) {
            stocks.append(ticker)
        }
    }
    
    func removeStock(ticker: String) {
        if let index = stocks.firstIndex(of: ticker) {
            stocks.remove(at: index)
        }
    }
    
    
}
