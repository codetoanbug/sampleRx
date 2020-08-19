//
//  ViewController.swift
//  RxSample
//
//  Created by Xuân Quỳnh Lê on 2020/08/19.
//  Copyright © 2020 グッドサイクルシステム. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bag = DisposeBag()

        let bannersEnabled = BehaviorRelay<String>(value: "code")

        bannersEnabled.accept("toan")
        bannersEnabled.accept("bug")

        let subscriber = bannersEnabled.subscribe { (event) in
            print("event = \(event)")
        }

        bannersEnabled.accept("viet")
        bannersEnabled.accept("nam")

        subscriber.disposed(by: bag)
    }


}

