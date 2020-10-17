//
//  SearchCell.swift
//  CalorieCounterApp
//
//

import UIKit

class SearchCell: UITableViewCell {

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
