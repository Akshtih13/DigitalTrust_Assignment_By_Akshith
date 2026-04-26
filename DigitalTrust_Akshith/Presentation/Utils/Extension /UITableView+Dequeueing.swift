//
//  UITableView+Dequeueing.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        return cell
    }

    func register<T: UITableViewCell>(_: T.Type) {
        let identifier = String(describing: T.self)
        return register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

}
