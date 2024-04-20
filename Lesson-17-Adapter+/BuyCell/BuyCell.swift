//
//  BuyCell.swift
//  Lesson-17-Adapter+
//
//  Created by Aleksandr Moroshovskyi on 20.04.2024.
//

import UIKit

class BuyCell: UITableViewCell {
    
    var buyCompletion: (() -> ())?
    
    @IBOutlet weak var titleTextLable: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    @IBAction func buyButton(_ sender: Any) {
        
        buyCompletion?()
    }
    
    func setup(with model: BuyCellDisplayModel) {
        
        titleTextLable.text = model.title
    }
}
