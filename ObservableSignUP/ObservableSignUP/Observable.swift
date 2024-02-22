//
//  Observable.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//

import Foundation

class Observable {
    
    private var closure: ((String) -> Void)?

    var value: String {
        didSet {
            closure?(value)
        }
    }

    init(_ value: String) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        closure(value)
        self.closure = closure
    }
    
}
