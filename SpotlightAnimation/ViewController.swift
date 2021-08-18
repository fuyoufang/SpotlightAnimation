//
//  ViewController.swift
//  SpotlightAnimation
//
//  Created by fuyoufang on 2021/8/18.
//

import UIKit

class ViewController: UIViewController {

    let spotlightView = SpotlightAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        spotlightView.frame = view.bounds
        view.addSubview(spotlightView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spotlightView.begin()
    }
}

