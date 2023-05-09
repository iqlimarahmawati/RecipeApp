//
//  DetailsMealsViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 05/05/23.
//
//
import UIKit

class DetailsMealsViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var mealsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Miscellaneous")
//        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var nameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    var nameMealslabel: UILabel = {
        let label = UILabel()
        label.text = "Name meals"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .label
        return label
    }()
    
    var categoryMealsLabel: UILabel = {
        let label = UILabel()
        label.text = "Category meals"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    let ingredientsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let ingredientLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let allIngredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "All ingredients"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    let instructionView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Instruction"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let allInstructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "All instructions"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    var idMeal = ""
    var detailMeals: MealsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .brown
        title = "Recipe Details"
        //        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        setupView()
        getViewModelDetail()
    }
    
    func setupView() {
        // MARK: SCROLL VIEW
        view.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        // MARK: MEALS IMAGE
        scrollView.addSubview(mealsImageView)
        mealsImageView.translatesAutoresizingMaskIntoConstraints = false
        mealsImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        mealsImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        mealsImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        mealsImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        mealsImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        
        // MARK: MEALS VIEW
        scrollView.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: mealsImageView.bottomAnchor, constant: -35).isActive = true
        nameView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        nameView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // MARK: MEALS NAME
        nameView.addSubview(nameMealslabel)
        nameMealslabel.translatesAutoresizingMaskIntoConstraints = false
        nameMealslabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 8).isActive = true
        nameMealslabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 8).isActive = true
        nameMealslabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -8).isActive = true
        nameMealslabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        // MARK: CATEGORY MEALS
        nameView.addSubview(categoryMealsLabel)
        categoryMealsLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryMealsLabel.topAnchor.constraint(equalTo: nameMealslabel.bottomAnchor, constant: 5).isActive = true
        categoryMealsLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 8).isActive = true
        categoryMealsLabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -8).isActive = true
        
        // MARK: INGREDIENTS VIEW
        scrollView.addSubview(ingredientsView)
        ingredientsView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 32).isActive = true
        ingredientsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        ingredientsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        //        ingredientsView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        // MARK: INGREDIENT TITLE
        ingredientsView.addSubview(ingredientLabel)
        ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientLabel.topAnchor.constraint(equalTo: ingredientsView.topAnchor, constant: 5).isActive = true
        ingredientLabel.leadingAnchor.constraint(equalTo: ingredientsView.leadingAnchor, constant: 8).isActive = true
        ingredientLabel.trailingAnchor.constraint(equalTo: ingredientsView.trailingAnchor, constant: -8).isActive = true
        ingredientLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // MARK: ALL INGREDIENTS
        ingredientsView.addSubview(allIngredientsLabel)
        allIngredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        allIngredientsLabel.topAnchor.constraint(equalTo: ingredientLabel.bottomAnchor, constant: 5).isActive = true
        allIngredientsLabel.leadingAnchor.constraint(equalTo: ingredientsView.leadingAnchor, constant: 8).isActive = true
        allIngredientsLabel.trailingAnchor.constraint(equalTo: ingredientsView.trailingAnchor, constant: -8).isActive = true
        allIngredientsLabel.bottomAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: -16).isActive = true
        
        // MARK: INSTRUCTIONS VIEW
        scrollView.addSubview(instructionView)
        instructionView.translatesAutoresizingMaskIntoConstraints = false
        instructionView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: 32).isActive = true
        instructionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        instructionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        instructionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true
        
        // MARK: INSTRUCTION TITLE
        instructionView.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.topAnchor.constraint(equalTo: instructionView.topAnchor, constant: 5).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: instructionView.leadingAnchor, constant: 8).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: instructionView.trailingAnchor, constant: -8).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // MARK: ALL INSTRUCTIONS
        instructionView.addSubview(allInstructionsLabel)
        allInstructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        allInstructionsLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 5).isActive = true
        allInstructionsLabel.leadingAnchor.constraint(equalTo: instructionView.leadingAnchor, constant: 8).isActive = true
        allInstructionsLabel.trailingAnchor.constraint(equalTo: instructionView.trailingAnchor, constant: -8).isActive = true
        allInstructionsLabel.bottomAnchor.constraint(equalTo: instructionView.bottomAnchor, constant: -16).isActive = true
    }
    
    func getViewModelDetail() {
        let detailViewModel = DetailMealsViewModel(urlString: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(self.idMeal)", apiService: GetMealsApi())
        detailViewModel.fetchDataDetails()
        detailViewModel.bindDetailData = { detailsDataModel in
            if let detailMealsDatas = detailsDataModel {
                for meal in detailMealsDatas.meals {
                    self.detailMeals = meal
                }
                
                DispatchQueue.main.async {
                    self.getData()
                }
            }
        }
    }
    
    func getData() {
        self.mealsImageView.kf.setImage(with: URL(string: self.detailMeals?.strMealThumb ?? "" ))
        self.nameMealslabel.text = self.detailMeals?.strMeal
        self.categoryMealsLabel.text = self.detailMeals?.strCategory
        self.allIngredientsLabel.text = "\(self.detailMeals?.strIngredient1 ?? ""), \(self.detailMeals?.strIngredient2 ?? ""), \(self.detailMeals?.strIngredient3 ?? ""), \(self.detailMeals?.strIngredient4 ?? ""), \(self.detailMeals?.strIngredient5 ?? "")"
        self.allInstructionsLabel.text = self.detailMeals?.strInstructions
        
        //MARK: DUMMY DATA
//        allIngredientsLabel.text = "All ingredients"
//
//        allInstructionsLabel.text = "Preheat oven to 350F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!"
    }
}
