//
//  DataLoader.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import Foundation

class DataLoader {
    
    func getSwitcherData() -> [SwitcherCellDisplayModel] {
        
        var models: [SwitcherCellDisplayModel] = []
        
        for i in 0 ... 4 {
            let newModel = SwitcherCellDisplayModel(title: "Title: \(i + 1)", isOn: false)
            models.append(newModel)
        }
        
        return models
    }
    
    func getBuyData() -> [BuyCellDisplayModel] {
        
        var models: [BuyCellDisplayModel] = []
        
        for i in 0 ... 2 {
            let newModel = BuyCellDisplayModel(title: "Buy description: \(i + 1)")
            models.append(newModel)
        }
        
        return models
    }
}
