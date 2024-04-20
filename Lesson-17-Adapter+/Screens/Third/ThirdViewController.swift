//
//  ThirdViewController.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter: MyTableViewAdapterInput!
    
    var switchModels: [SwitcherCellDisplayModel] = []
    var buyModels: [BuyCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchModels = DataLoader().getSwitcherData()
        buyModels = DataLoader().getBuyData()

//        let switchSection = SwitchableSectionAdapter(output: self)
//        let buySection = BuySectionAdapter(output: self)
        
        let switchCellAdapter = SwitchCellAdapter(output: self)
        
        let cellsSection = MyCellsSetSectionAdapter()
        cellsSection.cellAdapters = [
            switchCellAdapter
        ]
        
        let adapter = MyTableViewAdapter()
        adapter.sections = [
            cellsSection
//            switchSection,
//            buySection
        ]
        
        tableAdapter = adapter
        tableAdapter.setup(with: tableView)
    }
}

// MARK: SwitchableSectionAdapterOutput
extension ThirdViewController: SwitchableSectionAdapterOutput {
    
    func switchItemsCount() -> Int {
        
        return switchModels.count
    }
    
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        
        return switchModels[indexPath.row]
    }
}

// MARK: BuySectionAdapterAdapterOutput
extension ThirdViewController: BuySectionAdapterAdapterOutput {
    
    func buyItemsCount() -> Int {
        
        return buyModels.count
    }
    
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel {
        
        return buyModels[indexPath.row]
    }
    
    func buy(at indexPath: IndexPath) {
        
        let item = buyModels[indexPath.row]
        print(item.title)
    }
}

// MARK: - SwitchableSectionAdapterOutput
extension ThirdViewController: SwitchCellAdapterOutput {
    
    func switchDidAction(_ isOn: Bool) {
        //some code
    }
    
    func switchDisplayModel(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        return SwitcherCellDisplayModel(title: "SomeText", isOn: true)
    }
}
