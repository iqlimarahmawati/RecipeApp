//
//  countryViewModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 05/05/23.
//

import Foundation

protocol countryViewModelProtocol {
    var urlString: String {get}
    var bindCountryData: ((RecipeModel?) -> ())? {get set}
    func fetchDataCountry()
}

class countryViewModel : countryViewModelProtocol {
    
    func fetchDataCountry() {
        self.apiService?.callApi(model: RecipeModel.self, completion: { response in switch response {
        case .success(let success):
            self.bindCountryData?(success)
        case .failure(_):
            self.bindCountryData?(nil)
        }
        })
    }
    
    private var apiService: ApiServiceMealsProtocol?
    var urlString: String
    var data: RecipeModel?
    var bindCountryData: ((RecipeModel?) -> ())?
    
    init(urlString: String, apiService: ApiServiceMealsProtocol) {
        self.urlString =  urlString
        self.apiService = apiService
        
        if let url = URL (string: urlString) {
            self.apiService?.get(url: url)
        }
    }
}
