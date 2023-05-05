////
////  SeeAllListViewController.swift
////  RecipeApp
////
////  Created by Iqlima Rahmawati on 13/04/23.
//
//
import UIKit

class SeeAllCategoriesViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 60)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    var categorieslistData: [MealsModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCollectionView()
        setupLayout() 
    }

    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ListCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListCategoriesCollectionViewCell.identifier)
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

extension SeeAllCategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorieslistData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCategoriesCollectionViewCell.identifier, for: indexPath) as? ListCategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameCategoriesLabel.text = self.categorieslistData[indexPath.row].strCategory
        cell.listCategoriesImageView.image = UIImage(named: self.categorieslistData[indexPath.row].strMealThumb ?? "")
        return cell
    }
}
