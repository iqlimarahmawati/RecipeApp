//
//  allMealsViewModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 05/05/23.
//

import Foundation

protocol allMealsViewModelProtocol {
    var urlString :  String {get}
    var bindAllMealsData : ((RecipeModel?)->())? {get set}
    func fetchallMealsData()
}

class allMealsViewModel : allMealsViewModelProtocol {

    func fetchallMealsData() {
        self.apiService?.callApi(model: RecipeModel.self, completion: { response in switch response {
        case .success(let success):
            self.bindAllMealsData?(success)
        case .failure(_):
            self.bindAllMealsData?(nil)
        }
        })
    }
    private var apiService : ApiServiceMealsProtocol?
    var urlString: String
    var data: RecipeModel?
    var bindAllMealsData : ((RecipeModel?)->())?
    
    init(urlString: String, apiService : ApiServiceMealsProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL (string: urlString) {
            self.apiService?.get(url: url)
        }
    }
}

