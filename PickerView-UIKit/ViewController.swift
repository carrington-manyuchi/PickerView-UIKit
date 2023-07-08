//
//  ViewController.swift
//  PickerView-UIKit
//
//  Created by DA MAC M1 157 on 2023/07/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    //ui code
    var cities: [String]!

    //ui obj
    private let coolPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.frame = CGRect(x: 0, y: 300, width: 300, height: 200)
        return pickerView
    }()
    
    // First function
    override func viewDidLoad() {
        super.viewDidLoad()
        coolPickerView.delegate = self
        coolPickerView.dataSource = self
        //view.addSubview(coolPickerView)
        
        cities = ["Johannesburg", "Pretoria", "Durban", "Free State", "Cape Town"]
        
        // allows us to call pickerview  only when we select textfield
        myTextField.inputView = coolPickerView
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //number of sections
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // total number or rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    //title for PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    // wwidth for component
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 280
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    
    // customise components view
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let myView = UIView()
//        myView.backgroundColor = .cyan
//        return myView
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = cities[row]
        
//        let selectedRow = pickerView.selectedRow(inComponent: component)
//        myLabel.text = "\(selectedRow)"
        
        // assign certain city to textField's text
        myTextField.text = cities[row]
        
        // dismiss keyboard
        myTextField.resignFirstResponder()
    }
}
