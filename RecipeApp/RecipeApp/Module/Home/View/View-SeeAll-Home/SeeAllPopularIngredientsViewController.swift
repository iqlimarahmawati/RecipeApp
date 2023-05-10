//
//  SeeAllPopularIngredientsViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
//

import UIKit
import Kingfisher

class SeeAllPopularIngredientsViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 360, height: 75)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var popularIngredientsListData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Popular Ingredients"
        setUpCollectionView()
        setupLayout()
    }
    
    func setUpCollectionView() {
//        collectionView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ListPopularIngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListPopularIngredientsCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension SeeAllPopularIngredientsViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularIngredientsListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListPopularIngredientsCollectionViewCell.identifier, for: indexPath) as? ListPopularIngredientsCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.cellListPopularView.backgroundColor = .white
        let popular = popularIngredientsListData[indexPath.row].strIngredient
        cell.namePopularIngredientsLabel.text = popular
        cell.popularIngredientsImage.kf.setImage(with: URL(string: "https://www.themealdb.com/images/ingredients/\(popular ?? "").png"), placeholder: UIImage(named: "Miscellaneous"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ingredient = popularIngredientsListData[indexPath.row].strIngredient
        print("POPULAR INGREDIENTS KLIK \(String(describing: ingredient))")
        let viewModel = popularIngredientsViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(ingredient ?? "")", apiService: GetMealsApi())
        viewModel.fetchDataPopular()
        viewModel.bindPopularIngredientsData = { popularIngredientsDataModel in
            if let popularIngredientsData = popularIngredientsDataModel {
                var mealsByIngredient = [MealsModel]()
                for meal in popularIngredientsData.meals {
                    mealsByIngredient.append(meal)
                }
                DispatchQueue.main.async {
                    let viewController =  SeeAllMealsViewController()
                    viewController.title = ingredient
                    viewController.allMealsDatas.insert(contentsOf: mealsByIngredient, at: 0)
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
}

