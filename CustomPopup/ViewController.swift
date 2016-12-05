//
//  ViewController.swift
//  Scale
//
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  カスタムポップアップ
        let popupView:PopupView = UINib(nibName: "PopupView", bundle: nil).instantiate(withOwner: self,options: nil)[0] as! PopupView
        
        let viewColor = UIColor.black
        popupView.backgroundColor = viewColor.withAlphaComponent(0.5)
        popupView.frame = self.view.frame
        
        let baseViewColor = UIColor.white
        popupView.baseView.backgroundColor = baseViewColor.withAlphaComponent(0.7)
        popupView.baseView.layer.cornerRadius = 8.0
        
        self.view.addSubview(popupView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
