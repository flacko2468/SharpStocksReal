//
//  SharpStocksRealApp.swift
//  SharpStocksReal
//
//  Created by Rishi Ganeshan on 4/5/21.
//

import SwiftUI


@main
struct SharpStocksRealApp: App {
    var body: some Scene {
        WindowGroup {
            StockChooserView(viewModel: StockChooser(model: Model()))
        }
    }
}
