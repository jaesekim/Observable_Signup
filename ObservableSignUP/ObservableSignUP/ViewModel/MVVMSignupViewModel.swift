//
//  MVVMSignupViewModel.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/23/24.
//

import Foundation

class MVVMSignupViewModel {
    
    let inputValue = MVVMObservable("")
    let outputValue = MVVMObservable("")
    
    init() {
        inputValue.bind { value in
            self.validation()
        }
    }

    func validation() {
        
    }
}
