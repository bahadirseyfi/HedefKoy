//
//  UIButtonExt.swift
//  goalpost-app
//
//  Created by bahadir on 3.09.2020.
//  Copyright © 2020 Bahadır Seyfi. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 1, green: 0.7831269503, blue: 0.3455201983, alpha: 1)
    }
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
