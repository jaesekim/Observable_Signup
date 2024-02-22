//
//  Observable.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//

import Foundation

class Observable {
    
    private var closure: ((String) -> Void)?

    var text: String {
        didSet {
            closure?(text)
        }
    }

    var outputTextColor: String?

    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        closure(text)
        self.closure = closure
    }
    
}
