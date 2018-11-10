//
//  MyCustomView.swift
//  DynamicScrollView
//
//  Created by Rajesh Karmaker on 10/11/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

import UIKit

class MyCustomView: UIView {

    let nibName = "MyCustomView"
    var collapsed = true
    var collapsedSize:CGSize!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        collapsedSize = self.bounds.size
        self.addSubview(view)
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    override open var intrinsicContentSize: CGSize{
        get{
            if collapsed == true{
                return collapsedSize
            }
            else{
                return CGSize(width: self.bounds.size.width, height: 500)
            }
        }
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        collapsed = !collapsed
        let title = collapsed == true ? "Expand": "Collapse"
        sender.setTitle(title, for: .normal)
        invalidateIntrinsicContentSize()
    }
    
}
