//
//  CustomCorner.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 06/10/20.
//
import SwiftUI

struct CustomCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
