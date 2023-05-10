//
//  categoriesMealsViewModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
////
////
import Foundation

//MARK: PROTOCOL UNTUK CATEGORIES VIEW MODEL
protocol categoriesMealsViewModelProtocol {
    var urlString : String {get}
    var bindCategoriesMealsData : ((RecipeModel?)->())? {get set}
    func fetchDataCategories()
}

class categoriesMealsViewModel: categoriesMealsViewModelProtocol {
    
    func fetchDataCategories() {
        self.apiService?.callApi(model: RecipeModel.self, completion: {response in
            switch response {
            case .success(let success):
                self.bindCategoriesMealsData?(success)
            case .failure(_):
                self.bindCategoriesMealsData?(nil)
            }
        })
    }
    
    private var apiService : ApiServiceMealsProtocol?
    var urlString: String
    var data :RecipeModel?
    
    var bindCategoriesMealsData: ((RecipeModel?) -> ())?
    
    init(urlString : String, apiService: ApiServiceMealsProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        
    }
}
