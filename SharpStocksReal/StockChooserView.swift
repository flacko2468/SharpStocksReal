//
//  StockChooserView.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import SwiftUI

struct StockChooserView: View {
    @ObservedObject var viewModel: StockChooser
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        ForEach(viewModel.tickers, id: \.self) { ticker in
                            Text(ticker)
                        }
                        
                    }
                }
                
                NavigationLink(destination: StatisticsView(stats: Statistics(model: viewModel.model))) {
                    Text("Calculate")
                }
            }
            
        }
    }
}

