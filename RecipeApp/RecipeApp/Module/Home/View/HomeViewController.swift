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

        view.backgroundColor = .yellow
        addData()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)

        allMealsCollectionView.delegate = self
        allMealsCollectionView.dataSource = self
        allMealsCollectionView.register(UINib(nibName: "AllMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AllMealsCollectionViewCell.identifier)

        areaCollectionView.delegate = self
        areaCollectionView.dataSource = self
        areaCollectionView.register(UINib(nibName: "AreaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AreaCollectionViewCell.identifier)

        ingredientsCollectionView.delegate = self
        ingredientsCollectionView.dataSource = self
        ingredientsCollectionView.register(UINib(nibName: "IngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier)
    }
    
    func addData() {
        // TODO: HAPUS KALO UDAH ADA API
        // categories
        categoriesData.append(MealsModel(strMealThumb:"shushi", strMeal: "Shushi"))
        categoriesData.append(MealsModel(strMealThumb:"chicken",strMeal:"FriedChicken"))
        categoriesData.append(MealsModel(strMealThumb:"burger",strMeal:"Hamburger"))
        categoriesData.append(MealsModel(strMealThumb:"pizza",strMeal: "Pizza"))
        categoriesData.append(MealsModel(strMealThumb:"fruit salad",strMeal:"Salad"))
        
        // meals
        allMealsData.append(MealsModel(strMealThumb: "chicken", idMeal: "1", strMeal: "Fried Chicken", strCategory: "Chicken", strArea: "Batam"))
        allMealsData.append(MealsModel(strMealThumb:"", idMeal: "2", strMeal: "Donut", strCategory: "Sweets",strArea: "Jakarta" ))
        allMealsData.append(MealsModel(strMealThumb:"", idMeal:"4",strMeal: "Pizza Margerita", strCategory: "pizza", strArea: "Amerika"))
       
        // area
        areaData.append(MealsModel(strMealThumb:""))
        areaData.append(MealsModel(strMealThumb:""))
        areaData.append(MealsModel(strMealThumb:""))
        areaData.append(MealsModel(strMealThumb:""))
        
        // ingredients
        ingredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        ingredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        ingredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        ingredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        
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
//            return 1

        case allMealsCollectionView:
            return allMealsData.count
//            return 1

        case areaCollectionView:
            return areaData.count
//            return 1

        case ingredientsCollectionView:
            return ingredientsData.count
//            return 1

        default:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard let cell =  categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {
                 return UICollectionViewCell()
            }
            cell.backgroundColor = .gray
            cell.categoriesLabel.text = categoriesData[indexPath.row].strMeal
            cell.categoriesImage.image = (UIImage(named: "chicken"))
            return cell

        case allMealsCollectionView:
            guard let cell =  allMealsCollectionView.dequeueReusableCell(withReuseIdentifier: AllMealsCollectionViewCell.identifier, for: indexPath) as? AllMealsCollectionViewCell else {
                 return UICollectionViewCell()
            }

            cell.backgroundColor = .red

            return cell

        case areaCollectionView:
            guard let cell =  areaCollectionView.dequeueReusableCell(withReuseIdentifier: AreaCollectionViewCell.identifier, for: indexPath) as? AreaCollectionViewCell else {
                 return UICollectionViewCell()
            }

            cell.backgroundColor = .cyan

            return cell

        case ingredientsCollectionView:
            guard let cell =  ingredientsCollectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifier, for: indexPath) as? IngredientsCollectionViewCell else {
                 return UICollectionViewCell()
            }

            cell.backgroundColor = .yellow

            return cell

        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pilih cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 361, height: 134)
    }
}

//membuat home page stroryBoard
// 1. scroll view
// 2. stactView
// 3. collectionView
