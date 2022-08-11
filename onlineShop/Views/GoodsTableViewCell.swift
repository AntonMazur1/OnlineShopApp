//
//  GoodsTableViewCell.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import UIKit

class GoodsTableViewCell: UITableViewCell {
    static let identifier = "goodCell"
    var closure: (() -> ())?
    
    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var goodPrice: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func addButtonPressed() {
        closure?()
    }
    
    func setupCell(good: PositionForSaleModel) {
        goodImage.image = UIImage(named: good.image)
        goodName.text = good.name
        goodPrice.text = "\(good.price) UAH"
    }
}
