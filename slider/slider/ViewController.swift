//
//  ViewController.swift
//  slider
//
//  Created by Bumjin Park on 1/29/20.
//  Copyright © 2020 Bumjin Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var first_slider: UISlider!
    @IBOutlet weak var second_slider: UISlider!
    @IBOutlet weak var sum_label: UILabel!

    @IBOutlet weak var segValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func heightAction(_ sender: Any) {
        sum()
    }
    
    @IBAction func waistAction(_ sender: Any) {
        sum()
    }
    @IBAction func segAction(_ sender: Any) {
        sum()
    }
    
    func sum(){
        sum_label.text = "\(first_slider.value + second_slider.value )"
        
    }
    
    
}

