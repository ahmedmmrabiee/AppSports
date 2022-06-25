//
//  TableViewCellLeg.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import UIKit
protocol newPageYoutupe{
    func onClickYoutupe(index: Int)
}
class TableViewCellLeg: UITableViewCell {

    
    @IBOutlet var imgCellTable: UIImageView!
    
    @IBOutlet var labelCellTable: UILabel!
    
    var cellDelegate: newPageYoutupe?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   //youtupeButton  strYoutube
    @IBAction func buttonCellTableAction(_ sender: UIButton) {
        cellDelegate?.onClickYoutupe(index: (index?.row)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
