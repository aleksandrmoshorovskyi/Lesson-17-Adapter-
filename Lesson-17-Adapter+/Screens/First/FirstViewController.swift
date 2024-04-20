//
//  FirstViewController.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter: MyTableViewAdapterInput!
    
    var models: [SwitcherCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        models = DataLoader().getSwitcherData()

        let adapter = MyTableViewAdapter()
        //adapter.models = DataLoader().getSwitcherData()
        
        let switchableSection = SwitchableSectionAdapter(output: self)
        adapter.sections = [
            switchableSection
        ]
        
        tableAdapter = adapter
        tableAdapter.setup(with: tableView)
    }
}

// MARK: SwitchableSectionAdapterOutput
extension FirstViewController: SwitchableSectionAdapterOutput {
    
    func switchItemsCount() -> Int {
        
        return models.count
    }
    
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        
        return models[indexPath.row]
    }
}
