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
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    // MARK:  Dummy Data
    var categoriesData: [MealsModel] = []
    var allMealsData: [MealsModel] = []
    var populerIngredientsData: [MealsModel] = []
    var randomMealsData: [MealsModel] = []
    var countryData: [MealsModel] = []
//
    override func viewDidLoad() {
        super.viewDidLoad()

        addData()
        getData()
        setupCollectionView()
    }
    
    private func getData() {
        let categoriesViewModel = categoriesMealsViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/list.php?c=lis", apiService: GetMealsApi())
        categoriesViewModel.fetchDataCategories()
        categoriesViewModel.bindCategoriesMealsData = { categoriesMealsDataModel in
            print("this is the data: \(String(describing: categoriesMealsDataModel))")
            if let categoriesMealsData = categoriesMealsDataModel {
                for category in categoriesMealsData.meals {
                    self.categoriesData.append(category)
                }
                DispatchQueue.main.async {
                    self.categoriesCollectionView.reloadData()
                }
            }
        }
        
        //
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
        allMealsLayout.scrollDirection = .horizontal
        allMealsLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        allMealsLayout.itemSize = CGSize(width: 150, height: 180)

//        allMealsCollectionView.isScrollEbled = false
        allMealsCollectionView.collectionViewLayout = allMealsLayout
        allMealsCollectionView.delegate = self
        allMealsCollectionView.dataSource = self
        allMealsCollectionView.register(UINib(nibName: "AllMealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AllMealsCollectionViewCell.identifier)


        //MARK: setUp Popular Ingredients
        let popularIngredientsLayout = UICollectionViewFlowLayout()
        popularIngredientsLayout.scrollDirection = .horizontal
        popularIngredientsLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        popularIngredientsLayout.itemSize = CGSize(width: 147, height: 153)

        popularIngredientsCollectionView.collectionViewLayout = popularIngredientsLayout
        popularIngredientsCollectionView.delegate = self
        popularIngredientsCollectionView.dataSource = self
        popularIngredientsCollectionView.register(UINib(nibName: "PopularIngredientsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PopularIngredientsCollectionViewCell.identifier)


        //MARK: setUp Country
        let countryLayout = UICollectionViewFlowLayout()
        countryLayout.scrollDirection = .vertical
        countryLayout.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 8)
        countryLayout.itemSize = CGSize(width: 90, height: 90)

        countryCollectionView.collectionViewLayout = countryLayout
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
        countryCollectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)

    }
    
    func addData() {
        // TODO: HAPUS KALO UDAH ADA API
        // categories
//        categoriesData.append(MealsModel(strMealThumb:"shushi", strCategory: "Sushi"))
//        categoriesData.append(MealsModel(strMealThumb:"chicken", strCategory: "Fried Chicken"))
//        categoriesData.append(MealsModel(strMealThumb:"burger1", strCategory: "Hamburger"))
//        categoriesData.append(MealsModel(strMealThumb:"pizza", strCategory: "Pizza"))
//        categoriesData.append(MealsModel(strMealThumb:"fruitsalad", strCategory: "Salad"))
//        categoriesData.append(MealsModel(strMealThumb:"Frenchfries", strCategory: "French fries"))
//        categoriesCollectionView.reloadData()

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
        popularIngredientsCollectionView.reloadData()

        // country
        countryData.append(MealsModel(strMealThumb:"indonesia"))
        countryData.append(MealsModel(strMealThumb:"japan"))
        countryData.append(MealsModel(strMealThumb:"usa"))
        countryData.append(MealsModel(strMealThumb:"india"))
        countryCollectionView.reloadData()
    }

    @IBAction func seeAllCategoriesTap(_ sender: Any) {
        let viewController = SeeAllCategoriesViewController()
        viewController.categorieslistData = self.categoriesData
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func seeAllMealsTap(_ sender: Any) {
        let viewController =  SeeAllMealsViewController()
        viewController.allMealsDatas = self.allMealsData
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func seeAllPopularIngredientsTap(_ sender: Any) {
        let viewController = SeeAllPopularIngredientsViewController()
        viewController.populerIngredientsListData = self.populerIngredientsData
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
            guard let cell =  categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else {
                 return UICollectionViewCell()
            }
            cell.categoriesLabel.text = categoriesData[indexPath.row].strCategory
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
            cell.popularIngredientsImage.image = (UIImage(named: populerIngredientsData[indexPath.row].strMealThumb ?? ""))
            cell.namePopularIngredients.text = populerIngredientsData[indexPath.row].strIngredient1
            
            return cell
            
            
        case countryCollectionView:
            guard let cell =  countryCollectionView.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.identifier, for: indexPath) as? CountryCollectionViewCell else {
                 return UICollectionViewCell()
            }

            cell.countryImage.image = UIImage(named: countryData[indexPath.row].strMealThumb ?? "")
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
