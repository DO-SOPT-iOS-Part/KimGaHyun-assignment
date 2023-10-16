//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit

class ViewController: UIViewController {


    private var backgroundView : UIImageView = {
        let imageView = UIImageView()
        
        
        //imageView.image = UIImage(named: "Img")
        imageView.image = #imageLiteral(resourceName: "background")
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    func setLayout() {
        self.view.addSubview(backgroundView)
        
        //배경화면 레이아웃 잡기
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

        
        
       
    }
    
    


}




