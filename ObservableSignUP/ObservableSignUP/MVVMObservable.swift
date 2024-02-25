//
//  MVVMObservable.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/23/24.
//

import Foundation

// 다양한 타입에 대응할 수 있도록 제너릭 사용
class MVVMObservable<T> {
    
    // value가 변할 때마다 실행할 동작 함수 closure로 선언
    // value를 사용하고 싶은 곳에서 closure를 정의
    private var closure: ((T) -> Void)?
    
    // didSet을 활용해서 value 변할 때마다 closure 실행
    // parameter로는 value 자신이 들어간다
    var value: T {
        didSet{
            closure?(value)
        }
    }
    
    // 초기화구문을 써서 MVVMObserverable를 호출할 때 value에 값 할당
    init(_ value: T) {
        self.value = value
    }
    
    // closure(value) bind를 호출하자마자 closure를 한 번 실행할 수 있도록
    // Observable 인스턴스를 생성하자마자 value에 할당된 값으로 closure를 바로 실행
    // 외부에서 정의한 closure를 observable의 closure에 할당 -> closure자체는 외부에서 참조할 수 없도록 private 처리
    func bind(closure: @escaping (T) -> Void) {
        closure(value)
        self.closure = closure
    }
}
