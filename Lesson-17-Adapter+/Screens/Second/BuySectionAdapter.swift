//
//  BuySectionAdapter.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

protocol BuySectionAdapterAdapterOutput: AnyObject {
    
    func buyItemsCount() -> Int
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel
    
    func buy(at indexPath: IndexPath)
}

class BuySectionAdapter {
    
    private weak var output: BuySectionAdapterAdapterOutput!
    
    required init(output: BuySectionAdapterAdapterOutput) {
        self.output = output
    }
}

// MARK: MySectionAdapterInput
extension BuySectionAdapter: MySectionAdapterInput {
    
    func registerCells(in tableView: UITableView) {
        
        let nib = UINib(nibName: "BuyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BuyCell")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        
        return output.buyItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCell", for: indexPath) as? BuyCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.buyItem(at: indexPath)
        cell.setup(with: model)
        
        cell.buyCompletion = { [weak self] in
            guard let self = self else { return }
            
            self.output.buy(at: indexPath)
        }
        
        return cell
    }
}

