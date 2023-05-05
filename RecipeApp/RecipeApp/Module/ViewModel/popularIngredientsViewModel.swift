////
////  popularIngredientsViewModel.swift
////  RecipeApp
////
////  Created by Iqlima Rahmawati on 04/05/23.
////
//
//import Foundation
//
//protocol popularIngredientsViewModelProtocol {
//    var urlString : String {get}
//    var bindpopularIngredientsData : ((RecipeModel?)->())? {get set}
//}
//
//class popularIngredientsViewModel: popularIngredientsViewModelProtocol {
//  
//
//}
//
//private var apiService : ApiServiceMealsProtocol?
//var urlString: String
//var data : RecipeModel?
//var bindPopularIngredientsData: ((RecipeModel?)->())?
//
//init(urlString: String, apiService : ApiServiceMealsProtocol) {
//    self.urlString = urlString
//    self.apiService = apiService
//
//    if let url = url (String: urlString) {
//        self.apiService?.get(url: url)
//    }
//
//    func fetchDataPoplar() {
//    self.apiService?.callApi(model: RecipeModel.self, completion: { response in
//        switch response {
//        case .success(let success):
//            self.bindpopularIngredientsData?(success)
//        case .failure(_):
//            self.bindpopularIngredientsData?(nil)
//}
