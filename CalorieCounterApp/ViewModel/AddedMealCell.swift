//
//  AddedMealCell.swift
//  CalorieCounterApp
//
// Created by Timal Pathirana on 27/8/20.
//

import UIKit

class AddedMealCell: UITableViewCell {

    @IBOutlet var meal_name: UILabel!
    @IBOutlet var meal_detail_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
