//
//  ViewController.swift
//  PickerView
//
//  Created by DAM on 16/11/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var ropa:[Ropa] = [Ropa(img: UIImage(named: "p1")!, nombre: "Zapatillas"), Ropa(img: UIImage(named: "p2")!, nombre: "Chaqueta"), Ropa(img: UIImage(named: "p3")!, nombre: "Jersey")]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ropa.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        var myImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 100))
        
        myImageView.image = ropa[row].img
        
        myView.addSubview(myImageView)
        
        var nombre = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 100))
        nombre.text = ropa[row].nombre
        nombre.textColor = UIColor.black
        nombre.font = UIFont(name: "Verdana", size: 26)
        myView.addSubview(nombre)
        return myView
        
    }
    

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var btnClick: UIButton!
    
    
    @IBAction func btnClick(_ sender: Any) {
        print("me clica")
        animateFight(num:ropa.count)

    }
    
    func animateFight(num:Int) {

        var randomNumber = Int(arc4random_uniform(UInt32(num)))
        
        pickerView.selectRow(randomNumber, inComponent: 0, animated: true)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            
        }, completion: { (finished) in
            
            /*UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                
                }, completion: nil)*/
            /*
            UIView.animate(withDuration: 1, animations: { self.pickerView.backgroundColor = .black }, completion: nil)
            */
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
    }


}

