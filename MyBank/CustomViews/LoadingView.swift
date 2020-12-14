//
//  LoadingView.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 01/12/20.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    @IBOutlet weak var animationView: AnimationView!

    
    func showLoading() {
        
        self.animationView.loopMode = .loop
        self.animationView.play()
    }
    
    func hiddenLoading() {
        self.animationView.stop()
    }

}
