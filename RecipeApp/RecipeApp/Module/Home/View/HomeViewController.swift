//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    static let identifier = "HomeViewController"
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var allMealsCollectionView: UICollectionView!
    @IBOutlet weak var popularIngredientsCollectionView: UICollectionView!
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    @IBOutlet weak var seeAllButtonAllMeals: UIButton!
    @IBOutlet weak var seeAllButtonpopularIngredients: UIButton!
    @IBOutlet weak var seeAllButtonCountry: UIButton!
    
    var categoriesData: [MealsModel] = []
    var allMealsData: [MealsModel] = []
    var populerIngredientsData: [MealsModel] = []
    var countryData: [MealsModel] = []
    
    var filterMealsData: [MealsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        navbarSetup()
        customButton()
        
        getData()
//        addDataDummy()
    }
 
    func navbarSetup() {
//        self.title = "Recipe"
//        self.navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refreshClicked)
        )
    }
    
    func customButton() {
        seeAllButtonAllMeals.layer.borderColor = UIColor.orange.cgColor
        seeAllButtonAllMeals.layer.borderWidth = 1
        seeAllButtonAllMeals.layer.cornerRadius = 10
        seeAllButtonAllMeals.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        seeAllButtonpopularIngredients.layer.borderColor = UIColor.orange.cgColor
        seeAllButtonpopularIngredients.layer.borderWidth = 1
        seeAllButtonpopularIngredients.layer.cornerRadius = 10
        seeAllButtonpopularIngredients.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        seeAllButtonCountry.layer.borderColor = UIColor.orange.cgColor
        seeAllButtonCountry.layer.borderWidth = 1
        seeAllButtonCountry.layer.cornerRadius = 10
        seeAllButtonCountry.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    @objc func refreshClicked(_ sender: Any) {
        self.categoriesData = []
        self.allMealsData = []
        self.populerIngredientsData = []
        self.countryData = []
        
        self.getData()
    }
    
    //get API
    private func getData() {
        let categoriesViewModel = categoriesMealsViewModel(urlString: "https://www.themealdb.com/api/json/v2/1/list.php?c=lis", apiService: GetMealsApi())
        categoriesViewModel.fetchDataCategories()
        categoriesViewModel.bindCategoriesMealsData = { categoriesMealsDataModel in
            if let categoriesMealsDatas = categoriesMealsDataModel {
                for category in categoriesMealsDatas.meals {
                    self.categoriesData.append(category)
                }
                DispatchQueue.main.async {
                    self.categoriesCollectionView.reloadData()
                }
            }
        }
        
        let allMealsViewModel = allMealsViewModel(urlString: "https://www.themealdb.com/api/json/v2/1/randomselection.php", apiService: GetMealsApi())
        allMealsViewModel.fetchallMealsData()
        allMealsViewModel.bindAllMealsData = { allMealsDataModel in
            if let allMealsData = allMealsDataModel {
                for allMeals in allMealsData.meals {
                    self.allMealsData.append(allMeals)
                }
                DispatchQueue.main.async {
                    self.allMealsCollectionView.reloadData()
                }
            }
        }
        
        let popularViewModel = popularIngredientsViewModel(urlString: "https://www.themealdb.com/api/json/v2/1/list.php?i=list", apiService: GetMealsApi())
        popularViewModel.fetchDataPopular()
        popularViewModel.bindPopularIngredientsData = { popularIngredientsDataModel in
            if let popularIngredientsData = popularIngredientsDataModel {
                for popular in popularIngredientsData.meals {
                    self.populerIngredientsData.append(popular)
                }
                DispatchQueue.main.async {
                    self.popularIngredientsCollectionView.reloadData()
                }
            }
        }
        
        let countryViewModel = countryViewModel(urlString: "https://www.themealdb.com/api/json/v2/1/list.php?a=list", apiService: GetMealsApi())
        countryViewModel.fetchDataCountry()
        countryViewModel.bindCountryData = { countryDataModel in
            if let countryData = countryDataModel {
                for country in countryData.meals {
                    self.countryData.append(country)
                }
                DispatchQueue.main.async {
                    self.countryCollectionView.reloadData()
                }
            }
        }
    }
    
    
    func setupCollectionView() {
        // MARK: setUp Categories
        let categoriesLayout = UICollectionViewFlowLayout()
        categoriesLayout.scrollDirection = .horizontal
        categoriesLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)
        categoriesLayout.itemSize = CGSize(width: 97, height: 123)
//        categoriesLayout.minimumLineSpacing = 5
//        categoriesCollectionView.isScrollEnabled = false
        categoriesCollectionView.collectionViewLayout = categoriesLayout
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        
        // MARK: setUp AllMeals
        let allMealsLayout = UICollectionViewFlowLayout()
        allMealsLayout.scrollDirection = .horizontal
        allMealsLayout.sectionInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 0)
        allMealsLayout.itemSize = CGSize(width: 160, height: 220)
        allMealsLayout.minimumLineSpacing = 20
        allMealsCollectionView.isScrollEnabled = false
        allMealsCollectionView.collectionViewLayout = allMealsLayout
        allMealsCollectionView.delegate = self
        allMealsCollectionView.dataSource = self
        allMealsCollectionView.register(UINib(nibName: "AllMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AllMealsCollectionViewCell.identifier)
        
        //MARK: setUp Popular Ingredients
        let popularIngredientsLayout = UICollectionViewFlowLayout()
        popularIngredientsLayout.scrollDirection = .horizontal
        popularIngredientsLayout.minimumLineSpacing = 16
        popularIngredientsLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        popularIngredientsLayout.itemSize = CGSize(width: 72, height: 70)
        popularIngredientsCollectionView.collectionViewLayout = popularIngredientsLayout
        popularIngredientsCollectionView.isScrollEnabled = false
        popularIngredientsCollectionView.delegate = self
        popularIngredientsCollectionView.dataSource = self
        popularIngredientsCollectionView.register(UINib(nibName: "PopularIngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PopularIngredientsCollectionViewCell.identifier)
        
        //MARK: setUp Country
        let countryLayout = UICollectionViewFlowLayout()
        countryLayout.scrollDirection = .vertical
        countryLayout.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 8)
        countryLayout.itemSize = CGSize(width: 100, height: 50)
        countryCollectionView.collectionViewLayout = countryLayout
        countryCollectionView.isScrollEnabled = false
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
        countryCollectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)
    }
    
    // TODO: COMMENT DUMMY KALO UDAH ADA API
    func addDataDummy() {
        // categories
        categoriesData.append(MealsModel(strMealThumb:"shushi", strCategory: "Sushi"))
        categoriesData.append(MealsModel(strMealThumb:"chicken", strCategory: "Fried Chicken"))
        categoriesData.append(MealsModel(strMealThumb:"burger1", strCategory: "Hamburger"))
        categoriesData.append(MealsModel(strMealThumb:"pizza", strCategory: "Pizza"))
        categoriesData.append(MealsModel(strMealThumb:"fruitsalad", strCategory: "Salad"))
        categoriesData.append(MealsModel(strMealThumb:"Frenchfries", strCategory: "French fries"))
        categoriesCollectionView.reloadData()
        
        // all meals
        allMealsData.append(MealsModel(strMealThumb: "chicken", idMeal: "1", strMeal: "Fried Chicken", strCategory: "Chicken", strArea: "Batam"))
        allMealsData.append(MealsModel(strMealThumb:"Donut", idMeal: "2", strMeal: "Donut", strCategory: "Sweets",strArea: "Jakarta" ))
        allMealsData.append(MealsModel(strMealThumb:"pizza", idMeal:"4",strMeal: "Pizza Margerita", strCategory: "pizza", strArea: "Amerika"))
        allMealsData.append(MealsModel(strMealThumb:"pizza", idMeal:"4",strMeal: "Pizza Margerita", strCategory: "pizza", strArea: "Amerika"))
        allMealsCollectionView.reloadData()
        
        // popular ingredients
        populerIngredientsData.append(MealsModel(strMealThumb:"beef", strIngredient1: "Beef"))
        populerIngredientsData.append(MealsModel(strMealThumb:"chicken-1", strIngredient1:"Chicken "))
        populerIngredientsData.append(MealsModel(strMealThumb:"salmon", strIngredient1:"Salmon"))
        populerIngredientsData.append(MealsModel(strMealThumb:"shrimp", strIngredient1:"Shrimp"))
        populerIngredientsData.append(MealsModel(strMealThumb:"salmon", strIngredient1:"Salmon"))
        populerIngredientsData.append(MealsModel(strMealThumb:"shrimp", strIngredient1:"Shrimp"))
        populerIngredientsData.append(MealsModel(strMealThumb:"salmon", strIngredient1:"Salmon"))
        populerIngredientsData.append(MealsModel(strMealThumb:"shrimp", strIngredient1:"Shrimp"))
        populerIngredientsData.append(MealsModel(strMealThumb:"salmon", strIngredient1:"Salmon"))
        populerIngredientsData.append(MealsModel(strMealThumb:"shrimp", strIngredient1:"Shrimp"))
        popularIngredientsCollectionView.reloadData()
        
        // country
        countryData.append(MealsModel(strArea:"indonesia"))
        countryData.append(MealsModel(strArea:"japan"))
        countryData.append(MealsModel(strArea:"usa"))
        countryData.append(MealsModel(strArea:"india"))
        countryCollectionView.reloadData()
    }
    
    //MARK: SEE ALL KLIK
    @IBAction func seeAllMealsTap(_ sender: Any) {
        let viewController = SeeAllMealsViewController()
        viewController.allMealsDatas = self.allMealsData
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func seeAllPopularIngredientsTap(_ sender: Any) {
        let viewController = SeeAllPopularIngredientsViewController()
        viewController.popularIngredientsListData = self.populerIngredientsData
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func seeAreaTap(_ sender: Any) {
        let viewController = SeeAllCountryViewController()
        viewController.countryListData = self.countryData
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categoriesData.count
            
        case allMealsCollectionView:
            return allMealsData.count
            
        case popularIngredientsCollectionView:
            return populerIngredientsData.count
            
        case countryCollectionView:
            return countryData.count
            
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {
                return UICollectionViewCell()
            }
            let categories = categoriesData[indexPath.row].strCategory
            cell.categoriesLabel.text = categories
            cell.categoriesImage.image = UIImage(named: categories ?? "")
            return cell
            
        case allMealsCollectionView:
            guard let cell = allMealsCollectionView.dequeueReusableCell(withReuseIdentifier: AllMealsCollectionViewCell.identifier, for: indexPath) as? AllMealsCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.allMealsImage.kf.setImage(with: URL(string: allMealsData[indexPath.row].strMealThumb ?? ""), placeholder: UIImage(named: "Miscellaneous"))
            cell.strMeals.text = allMealsData[indexPath.row].strMeal
            cell.strCategories.text = allMealsData[indexPath.row].strCategory
            return cell
            
        case popularIngredientsCollectionView:
            guard let cell = popularIngredientsCollectionView.dequeueReusableCell(withReuseIdentifier: PopularIngredientsCollectionViewCell.identifier, for: indexPath) as? PopularIngredientsCollectionViewCell else {
                return UICollectionViewCell()
            }
            let ingredient = populerIngredientsData[indexPath.row].strIngredient
            cell.popularIngredientsImage.kf.setImage(with: URL(string: "https://www.themealdb.com/images/ingredients/\(ingredient ?? "").png"), placeholder: UIImage(named: "Miscellaneous"))
//            print("INI DATA SAYA = \(String(describing: ingredient))")
            cell.namePopularIngredients.text = ingredient
            
            return cell
            
            
        case countryCollectionView:
            guard let cell = countryCollectionView.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.identifier, for: indexPath) as? CountryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.countryLabel.text = countryData[indexPath.row].strArea
            return cell
            
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pilih cell
        switch collectionView {
        case categoriesCollectionView:
            self.filterMealsData = [] // Untuk kosongkan data
            let category = categoriesData[indexPath.row].strCategory
//            print("CATEGORIES KLIK \(String(describing: category))")
            let categoriesViewModel = categoriesMealsViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category ?? "")", apiService: GetMealsApi())
            categoriesViewModel.fetchDataCategories()
            categoriesViewModel.bindCategoriesMealsData = { categoriesMealsDataModel in
                if let categoriesMealsDatas = categoriesMealsDataModel {
                    for category in categoriesMealsDatas.meals {
                        self.filterMealsData.append(category)
                    }
                    DispatchQueue.main.async {
                        let viewController =  SeeAllMealsViewController()
                        viewController.title = category
                        viewController.allMealsDatas.insert(contentsOf: self.filterMealsData, at: 0)
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                }
            }
            
        case allMealsCollectionView:
            let idMeal = allMealsData[indexPath.row].idMeal
            let viewController =  DetailsMealsViewController()
            viewController.idMeal = idMeal ?? ""
            self.navigationController?.pushViewController(viewController, animated: true)
            
        case popularIngredientsCollectionView:
            self.filterMealsData = [] // Untuk kosongkan data
            let ingredient = populerIngredientsData[indexPath.row].strIngredient
            print("POPULAR INGREDIENTS KLIK \(String(describing: ingredient))")
            let viewModel = popularIngredientsViewModel(urlString: "https://www.themealdb.com/api/json/v2/1/filter.php?i=\(ingredient ?? "")", apiService: GetMealsApi())
            viewModel.fetchDataPopular()
            viewModel.bindPopularIngredientsData = { popularIngredientsDataModel in
                if let popularIngredientsData = popularIngredientsDataModel {
                    for meal in popularIngredientsData.meals {
                        self.filterMealsData.append(meal)
                    }
                    DispatchQueue.main.async {
                        let viewController =  SeeAllMealsViewController()
                        viewController.title = ingredient
                        viewController.allMealsDatas.insert(contentsOf: self.filterMealsData, at: 0)
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                }
            }
            
        case countryCollectionView:
            self.filterMealsData = [] // Untuk kosongkan data
            let country = countryData[indexPath.row].strArea
            print("COUNTRY KLIK \(String(describing: country))")
            let viewModel = countryViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(country ?? "")", apiService: GetMealsApi())
            viewModel.fetchDataCountry()
            viewModel.bindCountryData = { categoriesMealsDataModel in
                if let categoriesMealsDatas = categoriesMealsDataModel {
                    for meal in categoriesMealsDatas.meals {
                        self.filterMealsData.append(meal)
                    }
                    DispatchQueue.main.async {
                        let viewController =  SeeAllMealsViewController()
                        viewController.title = country
                        viewController.allMealsDatas.insert(contentsOf: self.filterMealsData, at: 0)
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                }
            }
            
        default:
            break
        }
    }
}

//membuat home page stroryBoard
// 1. scroll view
// 2. stactView
// 3. collectionView


