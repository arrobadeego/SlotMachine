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
    
    let pokemon = [#imageLiteral(resourceName: "bulbasaur"), #imageLiteral(resourceName: "charmander"), #imageLiteral(resourceName: "squirtle"), #imageLiteral(resourceName: "pikachu")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        playButton.frame = CGRect(x: 140, y: 400, width: 150, height: 150)
        playButton.layer.cornerRadius = 0.5 * playButton.bounds.size.width
        playButton.clipsToBounds = true
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemon.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        let myImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 70, height: 70))
        
        var rowString = String()
        switch row {
        case 0:
            rowString = "Bulbasaur"
            myImageView.image = UIImage(named:"bulbasaur.png")
        case 1:
            rowString = "Charmander"
            myImageView.image = UIImage(named:"charmander.png")
        case 2:
            rowString = "Squirtle"
            myImageView.image = UIImage(named:"squirtle.png")
        case 3:
            rowString = "Pikachu"
            myImageView.image = UIImage(named:"pikachu.png")
        default:
            rowString = "Error: too many rows"
            myImageView.image = nil
        }
        
        myView.addSubview(myImageView)
        
        return myView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        for index in 0...2 {
            let rand = Int(arc4random_uniform(4))
            pickerView.selectRow(rand, inComponent: index, animated: true)
            print(rand)
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

