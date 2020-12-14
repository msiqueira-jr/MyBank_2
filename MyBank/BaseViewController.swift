//
//  BaseViewController.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 01/12/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    var baseLoadingView: LoadingView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        // Do any additional setup after loading the view.
    }
    
    func showLoading() {
        
        self.baseLoadingView = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? LoadingView
        
        self.baseLoadingView?.frame = self.view.frame
        self.view.addSubview(self.baseLoadingView ?? UIView())
        self.baseLoadingView?.showLoading()
        
    }
    
    func hiddenLoading() {
        
        self.baseLoadingView?.hiddenLoading()
        self.baseLoadingView?.isHidden = true
    }
}
