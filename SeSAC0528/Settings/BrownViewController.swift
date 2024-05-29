//
//  BrownViewController.swift
//  SeSAC0528
//
//  Created by J Oh on 5/29/24.
//

import UIKit

class BrownViewController: UIViewController {
    
    static let id = "BrownViewController"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "네비게이션 타이틀"
        
        
    }
    
    // present - dismiss
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // push - pop
    @IBAction func popButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    

}
