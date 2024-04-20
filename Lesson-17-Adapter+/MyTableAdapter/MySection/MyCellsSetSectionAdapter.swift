//
//  MyCellsSetSectionAdapter.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class MyCellsSetSectionAdapter {

    var cellAdapters: [MyCellAdapterInput] = []
}

// MARK: - SectionAdapterInput
extension MyCellsSetSectionAdapter: MySectionAdapterInput {

    func registerCells(in tableView: UITableView) {
        cellAdapters.forEach { $0.registerCell(in: tableView) }
    }

    /*
    func numberOfRows(in section: Int) -> Int {
        return cellAdapters.count
    }
     */
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        cellAdapters.count
    }

    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return cellAdapters[indexPath.row].cellForRow(at: indexPath, in: tableView)
    }
    
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return cellAdapters[indexPath.row].heightForRow(at: indexPath, in: tableView)
    }
    
    func didSelectRow(at indexPath: IndexPath, in tableView: UITableView) {
        return cellAdapters[indexPath.row].didSelectRow(at: indexPath, in: tableView)
    }
}

