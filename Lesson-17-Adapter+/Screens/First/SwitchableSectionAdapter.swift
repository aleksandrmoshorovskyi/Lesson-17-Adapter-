//
//  SwitchableSectionAdapter.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

protocol SwitchableSectionAdapterOutput: AnyObject {
    
    func switchItemsCount() -> Int
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel
}

class SwitchableSectionAdapter {
    
    private weak var output: SwitchableSectionAdapterOutput!
    
    required init(output: SwitchableSectionAdapterOutput) {
        self.output = output
    }
}

// MARK: MySectionAdapterInput
extension SwitchableSectionAdapter: MySectionAdapterInput {
    
    func registerCells(in tableView: UITableView) {
        
        let nib = UINib(nibName: "SwitcherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SwitcherCell")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        
        return output.switchItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.switchItem(at: indexPath)
        cell.setup(with: model)
        
        return cell
    }
    
    /*
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        
        return 44.0
    }
    
    func didSelectRow(at indexPath: IndexPath, in tableView: UITableView) {
        
        // do nothing
    }
     */
}
