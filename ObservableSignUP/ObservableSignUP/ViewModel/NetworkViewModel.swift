//
//  NetworkViewModel.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/26/24.
//

import Foundation
import Alamofire

// 검색결과 테이블 나오고 다시 api 호출하는 법?
// 변수 하나로 되나..?
class NetworkViewModel {
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    var searchInputData: Observable<String> = Observable("")
    
    var originalMarketData: Observable<[CoinMarket]> = Observable([])
    
    var outputMarketData: Observable<[CoinMarket]> = Observable([])
    
    init() {
        // 인스턴스 생성되면 inputViewDidLoadTrigger bind closure에 callRequest 함수 넣어준다
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
        
        searchInputData.bind { text in
            
//            guard let text = text else { return }
            let result = self.outputMarketData.value.filter { $0.korean_name.contains(text)
            }
            self.outputMarketData.value = result
            print("result: ", result)
        }
    }

    // private를 쓰면 singleton이랑 상충되는 것이기에 이럴 때는 싱글톤을 사용하지 않는다?
    private func callRequest() {
        
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url)
            .responseDecodable(of: [CoinMarket].self) { response in
            switch response.result {
            case .success(let success):
                print("11111")
                self.originalMarketData.value = success
                print("22222")
                self.outputMarketData = self.originalMarketData
                print("33333")
                // alamofire는 비동기 처리 알아서 해 주는 거 아니었나? 이거 왜 처음에는 안됐지?
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
