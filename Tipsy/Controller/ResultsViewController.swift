//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by valters.steinblums on 25/10/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String = ""
    var headCount: Int = 2
    var tipPercentage: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(total)
        settingsLabel.text = "Split between \(headCount) people, with \(tipPercentage)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
