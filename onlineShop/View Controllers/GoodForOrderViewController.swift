//
//  GoodForOrderViewController.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import UIKit

class GoodForOrderViewController: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noGoodsLabel: UILabel!
    
    var goodsForOrderList: [PositionForSaleModel] = []
    var totalCheckOfOrder = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(nibName: "GoodsForOrderTableViewCell", bundle: nil),
            forCellReuseIdentifier: GoodsForOrderTableViewCell.identifier
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        checkConfirmForEnable()
        checkGoodsForOrder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        totalCheckOfOrder = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let confirmVC = segue.destination as? ConfirmOrderViewController else { return }
        confirmVC.totalSum = totalCheckOfOrder
        totalCheckOfOrder = 0
    }
    
    @IBAction func confirmMyOrder(_ sender: UIButton) {
        goodsForOrderList = []
    }
    
    private func checkConfirmForEnable() {
        if goodsForOrderList.isEmpty {
            confirmButton.isHidden = true
        } else {
            confirmButton.isHidden = false
        }
    }
    
    private func checkGoodsForOrder() {
        if goodsForOrderList.isEmpty {
            noGoodsLabel.isHidden = false
        } else {
            noGoodsLabel.isHidden = true
        }
    }
}

// MARK: - Table View Data Source/Delegate
extension GoodForOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goodsForOrderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goodsForOrder",
                                                       for: indexPath) as? GoodsForOrderTableViewCell
        else { return UITableViewCell() }
        
        let selectedGood = goodsForOrderList[indexPath.row]
        totalCheckOfOrder += Int(selectedGood.price) ?? 0
        cell.setupCell(selectedGood: selectedGood)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.goodsForOrderList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            checkConfirmForEnable()
            checkGoodsForOrder()
        }
    }
}
