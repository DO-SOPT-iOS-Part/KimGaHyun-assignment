//
//  ImageLiterals.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/12.
//

import UIKit

enum ImageLiterals {
    enum img {
        static var background: UIImage { .load(named: "background")}
        static var list: UIImage { .load(named: "list")}
    }
    
    enum icon {
        static var cloud: UIImage { .load(named: "cloud")}
        static var drizzle: UIImage { .load(named: "drizzle")}
        static var rain: UIImage { .load(named: "rain")}
        static var sunshower: UIImage { .load(named: "sunshower")}
        static var thunder: UIImage { .load(named: "thunder")}
        static var current: UIImage { .load(named: "current")}
        static var map: UIImage { .load(named: "map")}
        static var menu: UIImage { .load(named: "menu")}
        static var other: UIImage { .load(named: "other")}
        static var pre: UIImage { .load(named: "pre")}
        static var search: UIImage { .load(named: "search")}
        static var tempbar: UIImage { .load(named: "tempbar")}
    }
}
