//
//  AnswerCollectionViewCell.swift
//  Test
//
//  Created by Александр Чернов on 21.04.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var index : IndexPath?
    
    
    let kAnswerNib = UINib(nibName: "AnswerTableViewCell", bundle: nil)
    let kIdentifierAnswer = "kIdentifierAnswer"
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        tableView.register(kAnswerNib, forCellReuseIdentifier: kIdentifierAnswer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        buttionSettings()
    }
    
    func buttionSettings()
    {
            nextButton.alpha = 0
            nextButton.isEnabled = false
    }
    
    func setindex( index: Int)
    {
        questionLabel.text = "Ручной ввод ответа – для ответа на этот тип вопроса необходимо с клавиатуры ввести ответ в виде слова (текста) или числа в отведенное для этого поле. В этом типе вопроса может быть несколько \(index)"
    }
    
    
    @IBAction func nextButtonWasPressed(_ sender: UIButton)
    {
        NotificationCenter.default.post(name: NSNotification.Name("ButtonEnable"), object: nil)
        nextButton.alpha = 0
        nextButton.isEnabled = false
        clearCell()
    }
    
    func clearCell()
    {
        let cell = tableView.cellForRow(at: index!) as! AnswerTableViewCell
        cell.answerLabel.backgroundColor = UIColor.clear
    }
    
}

extension AnswerCollectionViewCell: UITableViewDataSource, UITableViewDelegate
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath) as! AnswerTableViewCell
            cell.answerLabel.backgroundColor = UIColor.green
            self.nextButton.alpha = 1
            self.nextButton.isEnabled = true
            index = indexPath
            //  здесь надо будет забить условие, если на ячейке с ответом стоит флаг тру, то сделать ее зеленой. Иначе сделать ее красной а правильный ответ закрасить зеленым.
//        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120
    }
}
