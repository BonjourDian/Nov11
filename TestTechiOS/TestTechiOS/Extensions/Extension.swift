//
//  Extension.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//
import UIKit


extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


extension Formatter {
    static let decimal: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = .current
        numberFormatter.maximumFractionDigits = 2 // your choice
        numberFormatter.maximumIntegerDigits = 6 // your choice
        return numberFormatter
    }()
}


extension FloatingPoint {
    var afficherUnFloat: String { Formatter.decimal.string(for: self) ?? "" }
}


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
      }
    }
