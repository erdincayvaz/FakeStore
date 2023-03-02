//
//  IntegerExt.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 1.03.2023.
//

import Foundation

extension Int {
    
    //Product Sayfasında Değerlendirme sayısı gösterme
    func getCountProduct() -> String{
        return "(" + self.description + ")"
    }
    
    //Product Detay Sayfasında Değerlendirme sayısı gösterme
    func getCountProductDetail() -> String{
        return "(" + self.description + " Değerlendirme)"
    }
}
