//
//  NumberQuestionCollectionViewCell.swift
//  Test
//
//  Created by Александр Чернов on 01.05.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class NumberQuestionCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    
    func configureNumberCell( index: Int)
    {
        numberLabel.text = "\(index)"
    }
}
