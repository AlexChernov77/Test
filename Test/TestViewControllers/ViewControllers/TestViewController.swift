//
//  TestViewController.swift
//  Test
//
//  Created by Александр Чернов on 21.04.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class TestViewController: UIViewController
{

    @IBOutlet weak var collectionView: UICollectionView!
    let kAnswerNib = UINib(nibName: "AnswerCollectionViewCell", bundle: nil)
    let kIdentifierAnswerCollectionViewCell = "kIdentifierAnswerCollectionViewCell"
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Завершить", style: .done, target: self, action: #selector(backButton))
        collectionView.register(kAnswerNib, forCellWithReuseIdentifier: kIdentifierAnswerCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
        notification()
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    @objc func backButton()
    {
        let alert = UIAlertController(title: "Действительно завершить тест?", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Да", style: .default) { (alert) in
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        let alertCancel = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        alert.addAction(alertCancel)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func notification()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(buttonEnabled), name: NSNotification.Name(rawValue: "ButtonEnable"), object: nil)
    }
    
    @objc func buttonEnabled()
    {
        let indexPathArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentIndexPath = indexPathArray.object(at: 0) as! IndexPath
        print(currentIndexPath)
        let nextIndexPath = IndexPath(item: currentIndexPath.item + 1, section: 0)
        if nextIndexPath.row < 20
        {
            collectionView.scrollToItem(at: IndexPath(item: nextIndexPath.row, section: 0), at: .right, animated: true)
        }
        if currentIndexPath.row == 19
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultsViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TestViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierAnswerCollectionViewCell, for: indexPath) as! AnswerCollectionViewCell
        cell.setindex(index: indexPath.item)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return collectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
}
