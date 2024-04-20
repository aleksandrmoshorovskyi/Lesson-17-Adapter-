//
//  MyTableViewAdapter.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class MyTableViewAdapter: NSObject {
    
    //var models: [SwitcherCellDisplayModel] = []
    var sections: [MySectionAdapterInput] = []
}

// MARK: - MyTableViewAdapterInput
extension MyTableViewAdapter: MyTableViewAdapterInput {
    
    func setup(with tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        sections.forEach {
            $0.registerCells(in: tableView)
        }
    }
}

extension MyTableViewAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return models.count
        
        return sections[section].numberOfRows(for: section, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
//        else {
//            assertionFailure()
//            return UITableViewCell()
//        }
//        
//        let model = models[indexPath.row]
//        cell.setup(with: model)
//        
//        return cell
        
        return sections[indexPath.section].cellForRow(at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return 60.0 //44.0
        
        return sections[indexPath.section].heightForRow(at: indexPath, in: tableView)
    }
}

extension MyTableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(" \(indexPath)")
        
        sections[indexPath.section].didSelectRow(at: indexPath, in: tableView)
    }
}
