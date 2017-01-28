//
//  ViewController.swift
//  SlotMachine
//
//  Created by Diego Moreira on 27/01/17.
//  Copyright © 2017 Diego Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var victories: UILabel!
    
    @IBOutlet weak var losses: UILabel!
    
    var vic = 0
    var los = 0
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        playButton.frame = CGRect(x: 110, y: 350, width: 200, height: 200)
        playButton.layer.cornerRadius = 0.5 * playButton.bounds.size.width
        playButton.clipsToBounds = true
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        for index in 0...2 {
            let rand = Int(arc4random_uniform(10))
            pickerView.selectRow(rand, inComponent: index, animated: true)
        }
        
        let pickerView0 = pickerView.selectedRow(inComponent: 0)
        let pickerView1 = pickerView.selectedRow(inComponent: 1)
        let pickerView2 = pickerView.selectedRow(inComponent: 2)
        
        if (pickerView0 == pickerView1) && pickerView1 == pickerView2 {
            vic = vic + 1
            victories.text = "Vitórias: \(vic)"
        } else {
            los = los + 1
            losses.text = "Derrotas: \(los)"
        }
        
    }
    
    
}

