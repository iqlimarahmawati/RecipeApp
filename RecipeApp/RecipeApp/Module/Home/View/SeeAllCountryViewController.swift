//
//  SeeAllCountryViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
//

import UIKit

class SeeAllCountryViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 60)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var countryListData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setupLayout()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ListCountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListCountryCollectionViewCell.identifier)
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

extension SeeAllCountryViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCountryCollectionViewCell.identifier, for: indexPath) as? ListCountryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.countryImage.image = UIImage(named: self.countryListData[indexPath.row].strMealThumb ?? "")
        return cell
    }
}
