//
//  ProductViewModel.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Foundation
import Alamofire

class ProductViewModel {
    
    var products = Observable<[Product]>()
    var isLoading = Observable<Bool>()
    var alertItem = Observable<AlertItem>()
    
    func getProducts(){
        isLoading.value = true
        
        NetworkManager.instance.fetch(endpoint: FakeStoreEndpoint.products, responseModel: [Product].self){ [self] result in
            
            DispatchQueue.main.async { [self] in
                isLoading.value = false
                
                switch result {
                case .success(let result):
                    self.products.value = result
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem.value = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem.value = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem.value = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem.value = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}

