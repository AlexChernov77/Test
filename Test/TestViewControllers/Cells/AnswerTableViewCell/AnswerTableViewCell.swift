//
//  AnswerTableViewCell.swift
//  Test
//
//  Created by Александр Чернов on 21.04.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var viewLabel: UIView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        viewLabel.layer.cornerRadius = 10
    }
    
    
    func configureSelf( index: Int)
    {
        answerLabel.text = "\(index + 1)) Ваш ответ под номером \(index)  bvbnnvvv  vvvhjvhj vjhbjkn jknlkb  jhvhvhjn hvjmnbknhnvjnmkbhvbj,njb, knhb,mj,vnbn,mbnb ,jvhnb,jbhmmn.kbmghbj knm;lmklnl;kjnlkmnmhvj,k.m/ lmnjhcxcvbnm,.nbvcvbnjkl;lkjh gfcghjkl;knb"
    }
}
