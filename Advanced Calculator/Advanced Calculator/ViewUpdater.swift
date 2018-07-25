//
//  ViewUpdater.swift
//  Calculator
//
//  Created by Sirak Berhane on 2018-06-01.
//  Copyright © 2018 Sirak Berhane. All rights reserved.
//

import Foundation
import UIKit

protocol MyViewDelegate {
    func viewString() -> String;
}

class ViewUpdater : UIView {
    var myViewDelegate : MyViewDelegate?
    private var str : String?

    func reloadData() {
        if myViewDelegate != nil {
            str = myViewDelegate!.viewString()
        }
        self.setNeedsDisplay()
    }
}

