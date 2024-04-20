//
//  SecondViewController.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter: MyTableViewAdapterInput!
    
    var models: [BuyCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models = DataLoader().getBuyData()

        let buySection = BuySectionAdapter(output: self)
        
        let adapter = MyTableViewAdapter()
        adapter.sections = [
            buySection
        ]
        
        tableAdapter = adapter
        tableAdapter.setup(with: tableView)
    }
}

// MARK: BuySectionAdapterAdapterOutput
extension SecondViewController: BuySectionAdapterAdapterOutput {

    func buyItemsCount() -> Int {
        
        return models.count
    }
    
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel {
        
        return models[indexPath.row]
    }
    
    func buy(at indexPath: IndexPath) {
        
        let item = models[indexPath.row]
        print(item.title)
    }
}
