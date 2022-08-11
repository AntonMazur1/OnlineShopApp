//
//  GoodsTableViewController.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import UIKit

class GoodsTableViewController: UITableViewController {
    private let goods = PositionForSaleModel.getPositions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(nibName: "GoodsTableViewCell", bundle: nil),
            forCellReuseIdentifier: GoodsTableViewCell.identifier
        )
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {}
}

// MARK: - Table View Data Source
extension GoodsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goods.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GoodsTableViewCell.identifier,
                                                       for: indexPath) as? GoodsTableViewCell
        else { return UITableViewCell() }
        
        let good = goods[indexPath.row]
        cell.goodImage.image = UIImage(named: good.image)
        cell.goodName.text = good.name
        cell.goodPrice.text = "\(good.price) UAH"
        cell.closure = { [unowned self] in
            guard let tabBar = navigationController?.topViewController as? UITabBarController else { return }
            guard let goodForOrderVC = tabBar.viewControllers?[1] as? GoodForOrderViewController else { return }
            if !goodForOrderVC.goodsForOrderList.contains(good) {
                goodForOrderVC.goodsForOrderList.append(good)
            }
        }
        
        return cell
    }
}
