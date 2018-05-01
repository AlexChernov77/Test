//
//  CheckResultsViewController.swift
//  Test
//
//  Created by Александр Чернов on 01.05.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class CheckResultsViewController: UIViewController
{

    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberCollectionView: UICollectionView!
    @IBOutlet weak var testCollectionView: UICollectionView!
    let kAnswerNib = UINib(nibName: "ResultCollectionViewCell", bundle: nil)
    let kIdentifierResultCollectionVC = "kIdentifierResultCollectionViewCell"
    let kNumberNib = UINib(nibName: "NumberQuestionCollectionViewCell", bundle: nil)
    let kIdentifierNumberCollectionVC = "kIdentifierNumberCollectionVC"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        testCollectionView.dataSource = self
        testCollectionView.delegate = self
        numberCollectionView.dataSource = self
        numberCollectionView.delegate = self
        numberCollectionView.register(kNumberNib, forCellWithReuseIdentifier: kIdentifierNumberCollectionVC)
        testCollectionView.register(kAnswerNib, forCellWithReuseIdentifier: kIdentifierResultCollectionVC)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Завершить", style: .done, target: self, action: #selector(backButton))
    }
    
    @objc func backButton()
    {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension CheckResultsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = testCollectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierResultCollectionVC, for: indexPath) as! ResultCollectionViewCell
        
        let numberCell = numberCollectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierNumberCollectionVC, for: indexPath) as! NumberQuestionCollectionViewCell
        
       if collectionView == numberCollectionView
       {
            numberCell.configureNumberCell(index: indexPath.item + 1)
            return numberCell
       }
        else
       {
            cell.setindex(index: indexPath.item + 1)
            return cell
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return collectionView == testCollectionView ? testCollectionView.frame.size : CGSize(width: 50, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return collectionView == testCollectionView ? 0 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == numberCollectionView
        {
            testCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}
