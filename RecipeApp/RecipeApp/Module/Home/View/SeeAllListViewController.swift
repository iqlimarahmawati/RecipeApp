////
////  SeeAllListViewController.swift
////  RecipeApp
////
////  Created by Phincon on 13/04/23.
//
//
//import UIKit
//
//class SeeAllListViewController: UIViewController {
//
//
//    var categorieslistData: [MealsModel] = []
//    var allMealslistData: [MealsModel] = []
//    var populerIngredientsListData: [MealsModel] = []
//    var randomMealsListData: [MealsModel] = []
//    var countryListData: [MealsModel] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setUpCollectionView()
//    }
//
//    func setUpCollectionView() {
//        lazy var collectionView: UICollectionView = {
//                let layout = UICollectionViewFlowLayout()
//                layout.minimumInteritemSpacing = 0
//                layout.minimumLineSpacing = 10
//                layout.scrollDirection = .vertical
//
//                let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//                collectionView.delegate = self
//                collectionView.dataSource = self
//                collectionView.register(ListCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(ListCategoriesCollectionViewCell.self))
//                collectionView.backgroundColor = .clear
//                return collectionView
//            }()
//    }
//}
//extension SeeAllListViewController:UICollectionViewDelegate, UICollectionViewDataSource  {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////          gu
//    }
//}
