//
//  CoinViewController.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/26/24.
//

import UIKit
import SnapKit

class CoinViewController: UIViewController {

    lazy var searchBar = {
        let view = UISearchBar()
        view.delegate = self
        return view
    }()
    
    lazy var coinTableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "coinMarketCell"
        )
        return view
    }()
    
    let viewModel = NetworkViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureConstraints()
        configureView()
        bindData()
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(coinTableView)
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        coinTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }

    func configureView() {
        view.backgroundColor = .systemGray5
    }
    
    func bindData() {
        viewModel.inputViewDidLoadTrigger.value = ()
        
        // api로 받아온 데이터 테이블이 바뀔 때마다 tableView 리로드
        viewModel.outputMarketData.bind { market in
            self.coinTableView.reloadData()
        }
        
        viewModel.originalMarketData.bind { _ in
            self.coinTableView.reloadData()
        }
        
        viewModel.searchInputData.bind { market in
            self.coinTableView.reloadData()
        }
    }
}

extension CoinViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputMarketData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: "coinMarketCell"
        )
        let target = viewModel.outputMarketData.value[indexPath.row]
        cell.textLabel?.text = target.korean_name
        cell.detailTextLabel?.text = target.market
        return cell
    }
}

extension CoinViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search click")
        guard let searched = searchBar.text else { return }
        print(searched)
        viewModel.searchInputData.value = searched
        print(viewModel.searchInputData.value)
    }
    // 검색이 왜 안되지 이거 바인드 해 줬는데? 비트
}
