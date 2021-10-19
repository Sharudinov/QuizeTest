//
//  UIView+Extension.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

extension UIView {
    
    func getViewFromXib() -> UIView? {
        let className = String(describing: Self.self)
        let anyNib = Bundle.main.loadNibNamed(
            className,
            owner: self,
            options: nil
        )?.first
        guard let customView = anyNib as? UIView else { return nil }
        return customView
    }
}
