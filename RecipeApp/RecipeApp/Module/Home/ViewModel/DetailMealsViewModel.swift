//
//  DetailMealsViewModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 08/05/23.
//

import Foundation

protocol detailViewModelProtocol {
    var urlString: String {get}
    var bindDetailData: ((RecipeModel?) -> ())? {get set}
    func fetchDataDetails()
}

class DetailMealsViewModel: detailViewModelProtocol {
    
    func fetchDataDetails() {
        self.apiService?.callApi(model: RecipeModel.self, completion: { response in switch response {
        case .success(let success):
            self.bindDetailData?(success)
        case .failure(_):
            self.bindDetailData?(nil)
        }
        })
    }
    
    private var apiService: ApiServiceMealsProtocol?
    var urlString: String
    var data: RecipeModel?
    var bindDetailData: ((RecipeModel?) -> ())?
    
    init(urlString: String, apiService: ApiServiceMealsProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL (string: urlString) {
            self.apiService?.get(url: url)
        }
    }
}
