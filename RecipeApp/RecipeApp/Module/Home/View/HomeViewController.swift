//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    static let identifier = "HomeViewController"

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var allMealsCollectionView: UICollectionView!
    @IBOutlet weak var areaCollectionView: UICollectionView!
    @IBOutlet weak var ingredientsCollectionView: UICollectionView!
    
    var categoriesData: [MealsModel] = []
    var allMealsData: [MealsModel] = []
    var areaData: [MealsModel] = []
    var ingredientsData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addData()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.collectionViewLayout = layout
        categoriesCollectionView.register(UINib(nibName: CategoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)

//        allMealsCollectionView.delegate = self
//        allMealsCollectionView.dataSource = self
//        allMealsCollectionView.collectionViewLayout = layout
//        allMealsCollectionView.register(UINib(nibName: AllMealsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AllMealsCollectionViewCell.identifier)
//
//        areaCollectionView.delegate = self
//        areaCollectionView.dataSource = self
//        areaCollectionView.collectionViewLayout = layout
//        areaCollectionView.register(UINib(nibName: AreaCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AreaCollectionViewCell.identifier)
//
//        ingredientsCollectionView.delegate = self
//        ingredientsCollectionView.dataSource = self
//        ingredientsCollectionView.collectionViewLayout = layout
//        ingredientsCollectionView.register(UINib(nibName: IngredientsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier)
    }
    
    func addData() {
        // TODO: HAPUS KALO UDAH ADA API
        // categories
        categoriesData.append(MealsModel(idMeal: "1", strMeal: "Jagung", strCategory: "sayuran", strArea: "Batam"))
        
//        // meals
//        allMealsData.append(MealsModel(idMeal: "1", strMeal: "Jagung", strCategory: "sayuran", strArea: "Batam"))
//
//        // area
//        areaData.append(MealsModel(idMeal: "1", strMeal: "Jagung", strCategory: "sayuran", strArea: "Batam"))
//
//        // inggredients
//        ingredientsData.append(MealsModel(idMeal: "1", strMeal: "Jagung", strCategory: "sayuran", strArea: "Batam"))
    }

    @IBAction func seeAllCategoriesTap(_ sender: Any) {
        
    }
    
    @IBAction func seeAllMealsTap(_ sender: Any) {
        
    }
    
    @IBAction func seeAreaTap(_ sender: Any) {
        
    }
    
    @IBAction func seeIngredientsTap(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categoriesData.count

//        case allMealsCollectionView:
//            return allMealsData.count
//
//        case areaCollectionView:
//            return areaData.count
//
//        case ingredientsCollectionView:
//            return ingredientsData.count

        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {
                 return UICollectionViewCell()
            }
            cell.labelSementara.text = categoriesData[indexPath.row].strMeal

            return cell

//        case allMealsCollectionView:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllMealsCollectionViewCell.identifier, for: indexPath) as? AllMealsCollectionViewCell else {
//                 return UICollectionViewCell()
//            }
//            cell.backgroundColor = .red
//
//            return cell
//
//        case areaCollectionView:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AreaCollectionViewCell.identifier, for: indexPath) as? AreaCollectionViewCell else {
//                 return UICollectionViewCell()
//            }
//            cell.backgroundColor = .cyan
//
//            return cell
//
//        case ingredientsCollectionView:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifier, for: indexPath) as? IngredientsCollectionViewCell else {
//                 return UICollectionViewCell()
//            }
//            cell.backgroundColor = .yellow
//
//            return cell

        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pilih cell
    }
}
