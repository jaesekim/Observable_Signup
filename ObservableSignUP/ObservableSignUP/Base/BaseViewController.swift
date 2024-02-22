//
//  BaseViewController.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    func configureHierarchy() {
        
    }
    
    func configureView() {
        view.backgroundColor = .systemGray5
    }
    
    func configureConstraints() {
        
    }
}
