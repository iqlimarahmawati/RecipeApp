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
    @IBOutlet weak var popularIngredientsCollectionView: UICollectionView!
    @IBOutlet weak var randomMealsCollectionView: UICollectionView!
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    var categoriesData: [MealsModel] = []
    var allMealsData: [MealsModel] = []
    var populerIngredientsData: [MealsModel] = []
    var randomMealsData: [MealsModel] = []
    var countryData: [MealsModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addData()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        // MARK: setUp Categories
        let categoriesLayout = UICollectionViewFlowLayout()
        categoriesLayout.scrollDirection = .horizontal
        categoriesLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        categoriesLayout.itemSize = CGSize(width: 85, height: 123)

//        categoriesCollectionView.isScrollEnabled = false
        categoriesCollectionView.collectionViewLayout = categoriesLayout
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        
        // MARK: setUp AllMeals
        let allMealsLayout = UICollectionViewFlowLayout()
        allMealsLayout.scrollDirection = .vertical
        allMealsLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        allMealsLayout.itemSize = CGSize(width: 150, height: 180)
        
        allMealsCollectionView.isScrollEnabled = false
        allMealsCollectionView.collectionViewLayout = allMealsLayout
        allMealsCollectionView.delegate = self
        allMealsCollectionView.dataSource = self
        allMealsCollectionView.register(UINib(nibName: "AllMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AllMealsCollectionViewCell.identifier)
        
        
        //MARK: setUp Popular Ingredients
        let popularIngredientsLayout = UICollectionViewFlowLayout()
        popularIngredientsLayout.scrollDirection = .horizontal
        popularIngredientsLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        popularIngredientsLayout.itemSize = CGSize(width: 150, height: 180)
        
        popularIngredientsCollectionView.collectionViewLayout = popularIngredientsLayout
        popularIngredientsCollectionView.delegate = self
        popularIngredientsCollectionView.dataSource = self
        popularIngredientsCollectionView.register(UINib(nibName: "PopularIngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PopularIngredientsCollectionViewCell.identifier)
        
        
        //MARK: Random Meals
        let randomMealsLayout = UICollectionViewFlowLayout()
        randomMealsLayout.scrollDirection = .horizontal
        randomMealsLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        randomMealsLayout.itemSize = CGSize(width: 150, height: 180)
        
        randomMealsCollectionView.collectionViewLayout = randomMealsLayout
        randomMealsCollectionView.delegate = self
        randomMealsCollectionView.dataSource = self
        randomMealsCollectionView.register(UINib(nibName: "RandomMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RandomMealsCollectionViewCell.identifier)
        
        
        //MARK: setUp Country
        let countryLayout = UICollectionViewFlowLayout()
        countryLayout.scrollDirection = .horizontal
        countryLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        countryLayout.itemSize = CGSize(width: 150, height: 180)
        
        countryCollectionView.collectionViewLayout = countryLayout
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
        countryCollectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)
        
    }
    
    func addData() {
        // TODO: HAPUS KALO UDAH ADA API
        // categories
        categoriesData.append(MealsModel(strMealThumb:"shushi", strMeal: "Shushi"))
        categoriesData.append(MealsModel(strMealThumb:"chicken",strMeal:"Fried Chicken"))
        categoriesData.append(MealsModel(strMealThumb:"burger1",strMeal:"Hamburger"))
        categoriesData.append(MealsModel(strMealThumb:"pizza",strMeal: "Pizza"))
        categoriesData.append(MealsModel(strMealThumb:"fruitsalad",strMeal:"Salad"))
        categoriesCollectionView.reloadData()
        
        // all meals
        allMealsData.append(MealsModel(strMealThumb: "chicken", idMeal: "1", strMeal: "Fried Chicken", strCategory: "Chicken", strArea: "Batam"))
        allMealsData.append(MealsModel(strMealThumb:"donut", idMeal: "2", strMeal: "Donut", strCategory: "Sweets",strArea: "Jakarta" ))
        allMealsData.append(MealsModel(strMealThumb:"pizza", idMeal:"4",strMeal: "Pizza Margerita", strCategory: "pizza", strArea: "Amerika"))
        allMealsCollectionView.reloadData()
       
        // popular ingredients
        populerIngredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        populerIngredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        populerIngredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        populerIngredientsData.append(MealsModel(strMealThumb:"", strMeal:""))
        popularIngredientsCollectionView.reloadData()
        
        // random meals
        randomMealsData.append(MealsModel(strMealThumb:"", strMeal:""))
        randomMealsData.append(MealsModel(strMealThumb:"", strMeal:""))
        randomMealsData.append(MealsModel(strMealThumb:"", strMeal:""))
        randomMealsData.append(MealsModel(strMealThumb:"", strMeal:""))
        randomMealsCollectionView.reloadData()
        
        
        // country
        countryData.append(MealsModel(strMealThumb:""))
        countryData.append(MealsModel(strMealThumb:""))
        countryData.append(MealsModel(strMealThumb:""))
        countryData.append(MealsModel(strMealThumb:""))
        countryCollectionView.reloadData()
        
        
        
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

        case allMealsCollectionView:
            return allMealsData.count

        // TODO: Tambah case nya

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
            cell.categoriesLabel.text = categoriesData[indexPath.row].strMeal
            cell.categoriesImage.image = (UIImage(named: categoriesData[indexPath.row].strMealThumb ?? ""))
            return cell

        case allMealsCollectionView:
            guard let cell =  allMealsCollectionView.dequeueReusableCell(withReuseIdentifier: AllMealsCollectionViewCell.identifier, for: indexPath) as? AllMealsCollectionViewCell else {
                 return UICollectionViewCell()
            }
            
            cell.allMealsImage.image = UIImage(named: allMealsData[indexPath.row].strMealThumb ?? "")
            cell.strMeals.text = allMealsData[indexPath.row].strMeal
            cell.strCategories.text = allMealsData[indexPath.row].strCategory
            return cell
            
        case popularIngredientsCollectionView:
            guard let cell =  popularIngredientsCollectionView.dequeueReusableCell(withReuseIdentifier: PopularIngredientsCollectionViewCell.identifier, for: indexPath) as? PopularIngredientsCollectionViewCell else {
                 return UICollectionViewCell()
            }
            
            return cell
            
        case randomMealsCollectionView:
            guard let cell =  randomMealsCollectionView.dequeueReusableCell(withReuseIdentifier: RandomMealsCollectionViewCell.identifier, for: indexPath) as? RandomMealsCollectionViewCell else {
                 return UICollectionViewCell()
            }
            
            return cell
            
        case countryCollectionView:
            guard let cell =  countryCollectionView.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.identifier, for: indexPath) as? CountryCollectionViewCell else {
                 return UICollectionViewCell()
            }

            cell.backgroundColor = .cyan

            return cell


        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pilih cell
    }
}

//membuat home page stroryBoard
// 1. scroll view
// 2. stactView
// 3. collectionView
