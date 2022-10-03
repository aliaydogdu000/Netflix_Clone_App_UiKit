//
//  Extensions.swift
//  Netflix Clone App
//
//  Created by Ali Aydoğdu on 1.10.2022.
//

import Foundation

extension String{
    func capitalizeFirstLetter() ->String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}


