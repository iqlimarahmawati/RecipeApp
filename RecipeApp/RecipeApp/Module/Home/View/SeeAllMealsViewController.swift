//
//  SeeAllMealsViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
//

import UIKit

class SeeAllMealsViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 60)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var allMealsDatas: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setupLayout()
    }
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ListAllMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListAllMealsCollectionViewCell.identifier)
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
extension SeeAllMealsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMealsDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListAllMealsCollectionViewCell.identifier, for: indexPath) as? ListAllMealsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.nameListAllMeals.text = self.allMealsDatas[indexPath.row].strMeal
        cell.categoriesListAllMeals.text = self.allMealsDatas[indexPath.row].strCategory
        return cell
    }
}
