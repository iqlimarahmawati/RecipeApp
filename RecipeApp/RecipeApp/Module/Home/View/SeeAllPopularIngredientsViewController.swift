//
//  SeeAllPopularIngredientsViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
//

import UIKit

class SeeAllPopularIngredientsViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 60)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var populerIngredientsListData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setupLayout()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ListPopularIngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListPopularIngredientsCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
    }
    
}

extension SeeAllPopularIngredientsViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populerIngredientsListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListPopularIngredientsCollectionViewCell.identifier, for: indexPath) as? ListPopularIngredientsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cellListPopularView.backgroundColor = .brown
        cell.namePopularIngredientsLabel.text = self.populerIngredientsListData[indexPath.row].strIngredient1
        cell.popularIngredientsImage.image = UIImage(named: self.populerIngredientsListData[indexPath.row].strMealThumb ?? "")
        return cell
    }
}

