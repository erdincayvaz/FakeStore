//
//  Observable.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}

