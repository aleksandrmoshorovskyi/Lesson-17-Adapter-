//
//  SwitchCellAdapter.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

protocol SwitchCellAdapterOutput: AnyObject {
    
    func switchDidAction(_ isOn: Bool)
    func switchDisplayModel(at indexPath: IndexPath) -> SwitcherCellDisplayModel
}

class SwitchCellAdapter {
    
    private weak var output: SwitchCellAdapterOutput!
    
    required init(output: SwitchCellAdapterOutput) {
        self.output = output
    }
}

// MARK: CellAdapterInput
extension SwitchCellAdapter: MyCellAdapterInput {
    
    func registerCell(in tableView: UITableView) {
        
        let nib = UINib(nibName: "SwitcherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SwitcherCell")
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.switchDisplayModel(at: indexPath)
        cell.setup(with: model)
        
        return cell
    }
}
