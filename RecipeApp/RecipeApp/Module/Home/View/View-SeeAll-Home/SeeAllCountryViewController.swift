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
        layout.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 20)
        layout.itemSize = CGSize(width: 110, height: 50)
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var countryListData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country"
        setUpCollectionView()
        setupLayout()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 24).isActive = true
    }
    
}

extension SeeAllCountryViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.identifier, for: indexPath) as? CountryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.countryLabel.text = countryListData[indexPath.row].strArea
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let country = countryListData[indexPath.row].strArea
        print("COUNTRY KLIK \(String(describing: country))")
        let viewModel = countryViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(country ?? "")", apiService: GetMealsApi())
        viewModel.fetchDataCountry()
        viewModel.bindCountryData = { categoriesMealsDataModel in
            if let categoriesMealsDatas = categoriesMealsDataModel {
                var mealsByCountry = [MealsModel]()
                for meal in categoriesMealsDatas.meals {
                    mealsByCountry.append(meal)
                }
                DispatchQueue.main.async {
                    let viewController =  SeeAllMealsViewController()
                    viewController.title = country
                    viewController.allMealsDatas.insert(contentsOf: mealsByCountry, at: 0)
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
}
