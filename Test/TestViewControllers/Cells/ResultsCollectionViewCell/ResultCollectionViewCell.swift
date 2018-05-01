//
//  ResultCollectionViewCell.swift
//  Test
//
//  Created by Александр Чернов on 01.05.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell
{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    let kAnswerNib = UINib(nibName: "AnswerTableViewCell", bundle: nil)
    let kIdentifierAnswer = "kIdentifierAnswer"
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        tableView.register(kAnswerNib, forCellReuseIdentifier: kIdentifierAnswer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setindex( index: Int)
    {
        questionLabel.text = "Ручной ввод ответа – для ответа на этот тип вопроса необходимо с клавиатуры ввести ответ в виде слова (текста) или числа в отведенное для этого поле. В этом типе вопроса может быть несколько \(index)"
    }

}

extension ResultCollectionViewCell: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifierAnswer, for: indexPath) as! AnswerTableViewCell
        cell.configureSelf(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120
    }
}
