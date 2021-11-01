//
//  CustomNavigationBar.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/01.
//

import UIKit

class CustomNavigationBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
}
