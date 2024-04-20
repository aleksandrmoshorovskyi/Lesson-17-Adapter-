//
//  SwitcherCell.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class SwitcherCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLable: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    @IBAction func switcherAction(_ sender: Any) {
        
    }
    
    func setup(with model: SwitcherCellDisplayModel) {
        
        titleTextLable.text = model.title
        switcher.isOn = model.isOn
    }
}
