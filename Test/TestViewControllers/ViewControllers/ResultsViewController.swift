//
//  ResultsViewController.swift
//  Test
//
//  Created by Александр Чернов on 01.05.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Завершить", style: .done, target: self, action: #selector(backButton))
    }
    
    @IBAction func buttonWasPressed(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "lastVC") as! CheckResultsViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func backButton()
    {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
