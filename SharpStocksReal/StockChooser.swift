//
//  StockChooser.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import SwiftUI


class StockChooser: ObservableObject {
    @ObservedObject var model: Model
    
    init(model: Model) {
        self.model = model
    }
    
    
    // MARK: - Intent
    func addStock(ticker: String) {
        model.addStock(ticker: ticker)
    }
    
    func removeStock(ticker: String) {
        model.removeStock(ticker: ticker)
    }
    
    // MARK: - Access to model
    var tickers: [String] {
        get {
            return model.stocks
        }
    }
    
}
