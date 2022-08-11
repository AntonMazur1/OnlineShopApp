//
//  ConfirmOrderViewController.swift
//  onlineShop
//
//  Created by Клоун on 06.08.2022.
//

import UIKit

class ConfirmOrderViewController: UIViewController {
    @IBOutlet weak var sumOfOrder: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var patronymicTextField: UITextField!
    @IBOutlet weak var wayOfDelivery: UITextField!
    @IBOutlet weak var cityOfDelivery: UITextField!
    
    private let wayOfDeliveryPickerView = UIPickerView()
    private let cityOfDeliveryPickerView = UIPickerView()
    
    var totalSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumOfOrder.text = String(describing: "Сумма заказа:\(totalSum)")
        
        nameTextField.delegate = self
        secondNameTextField.delegate = self
        patronymicTextField.delegate = self
        
        wayOfDeliveryPickerView.delegate = self
        wayOfDeliveryPickerView.dataSource = self
        
        cityOfDeliveryPickerView.delegate = self
        cityOfDeliveryPickerView.dataSource = self
        
        cityOfDelivery.inputView = cityOfDeliveryPickerView
        wayOfDelivery.inputView = wayOfDeliveryPickerView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func confirmButtonTapped() {
        guard nameTextField.text != "",
              secondNameTextField.text != "",
              patronymicTextField.text != "",
              wayOfDelivery.text != "",
              cityOfDelivery.text != ""
        else {
            showAlert(with: "Введите данные",
                      and: "Заполните все поля",
                      completion: { return })
            return
        }
        showAlert(with: "Спасибо за заказ",
                  and: "Ваш заказ был успешно получен",
                  completion: { [weak self] in
            self?.performSegue(withIdentifier: "unwind", sender: nil)
        })
    }
    
    private func showAlert(with title: String, and message: String, completion: @escaping (() -> ())) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in completion() }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

//MARK: UIPickerView Data Source/Delegate
extension ConfirmOrderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case wayOfDeliveryPickerView:
            return DataStorage.shared.waysOfDelivery.count
        default:
            return DataStorage.shared.cities.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case wayOfDeliveryPickerView:
            return DataStorage.shared.waysOfDelivery[row]
        default:
            return DataStorage.shared.cities[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case wayOfDeliveryPickerView:
            wayOfDelivery.text = DataStorage.shared.waysOfDelivery[row]
            wayOfDelivery.resignFirstResponder()
        default:
            cityOfDelivery.text = DataStorage.shared.cities[row]
            cityOfDelivery.resignFirstResponder()
        }
    }
}

//MARK: Text Field Validation
extension ConfirmOrderViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
            secondNameTextField.becomeFirstResponder()
        } else if textField == secondNameTextField {
            secondNameTextField.resignFirstResponder()
            patronymicTextField.becomeFirstResponder()
        }
        
        return true
    }
}
