////
//  popularIngredientsViewModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 04/05/23.
//
//
import Foundation

protocol popularIngredientsViewModelProtocol {
    var urlString : String {get}
    var bindPopularIngredientsData : ((RecipeModel?)->())? {get set}
    func fetchDataPopular()
}

class popularIngredientsViewModel: popularIngredientsViewModelProtocol {
    
    func fetchDataPopular() {
        self.apiService?.callApi(model: RecipeModel.self, completion: { response in switch response {
        case .success(let success):
            self.bindPopularIngredientsData?(success)
        case .failure(_):
            self.bindPopularIngredientsData?(nil)
        }
            
        })
        
    }
    
    private var apiService : ApiServiceMealsProtocol?
    var urlString: String
    var data : RecipeModel?
    var bindPopularIngredientsData: ((RecipeModel?)->())?
    
    init(urlString: String, apiService : ApiServiceMealsProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL (string: urlString) {
            self.apiService?.get(url: url)
        }
    }
}
