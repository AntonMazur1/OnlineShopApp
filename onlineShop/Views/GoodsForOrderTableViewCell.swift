//
//  GoodsForOrderTableViewCell.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import UIKit

class GoodsForOrderTableViewCell: UITableViewCell {
    static let identifier = "goodsForOrder"

    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var goodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
