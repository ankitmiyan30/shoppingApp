//
//  DressModel.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 06/10/20.
//

import SwiftUI

struct DressModel: Identifiable, Decodable {
    var id = UUID().uuidString
    var image: String
    var price: String
    var title: String
    var colorAvl: Int
    var isFav: Bool
}

class GolbleModelPublisher: ObservableObject {
    @Published var dressModel = dressModelGirls
}

var dressModelGirls = [
    DressModel(image: "p1", price: "$500", title: "Wedding Dress", colorAvl: 4, isFav: true),
    DressModel(image: "p2", price: "$570", title: "T-Shirt", colorAvl: 2, isFav: false),
    DressModel(image: "p3", price: "$490", title: "Sheath Dress", colorAvl: 3, isFav: true),
    DressModel(image: "p4", price: "$690", title: "Gym clothes", colorAvl: 3, isFav: true),
    DressModel(image: "p9", price: "$7690", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p6", price: "$990", title: "Jeans", colorAvl: 3, isFav: false),
    DressModel(image: "p7", price: "$1090", title: "Kurti", colorAvl: 3, isFav: true),
    DressModel(image: "p5", price: "$790", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p8", price: "$790", title: "Skirt", colorAvl: 3, isFav: true)
]

var arrayOfDressModels = [[
    DressModel(image: "p1", price: "$500", title: "Wedding Dress", colorAvl: 4, isFav: true),
    DressModel(image: "p2", price: "$570", title: "T-Shirt", colorAvl: 2, isFav: false),
    DressModel(image: "p3", price: "$490", title: "Sheath Dress", colorAvl: 3, isFav: true),
    DressModel(image: "p4", price: "$690", title: "Gym clothes", colorAvl: 3, isFav: true),
    DressModel(image: "p9", price: "$7690", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p6", price: "$990", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p7", price: "$1090", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p5", price: "$790", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p8", price: "$790", title: "Skirt", colorAvl: 3, isFav: true)
    
],[
    DressModel(image: "p9", price: "$7690", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p6", price: "$990", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p7", price: "$1090", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p5", price: "$790", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p8", price: "$790", title: "Skirt", colorAvl: 3, isFav: true)
    
],[
    DressModel(image: "p6", price: "$990", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p7", price: "$1090", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p5", price: "$790", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p8", price: "$790", title: "Skirt", colorAvl: 3, isFav: true)
    
],[
    DressModel(image: "p1", price: "$500", title: "Wedding Dress", colorAvl: 4, isFav: true),
    DressModel(image: "p2", price: "$570", title: "T-Shirt", colorAvl: 2, isFav: false),
    DressModel(image: "p3", price: "$490", title: "Sheath Dress", colorAvl: 3, isFav: true),
    DressModel(image: "p4", price: "$690", title: "Gym clothes", colorAvl: 3, isFav: true),
    DressModel(image: "p9", price: "$7690", title: "Skirt", colorAvl: 3, isFav: true),
    DressModel(image: "p6", price: "$990", title: "Skirt", colorAvl: 3, isFav: false),
    DressModel(image: "p7", price: "$1090", title: "Skirt", colorAvl: 3, isFav: true)
    
]]

var scrollsTab = ["Women", "Men", "Kids", "Casual"]

var drawerMenu = ["Home", "MyCart", "About Us", "Contact Us", "Logout",]
var systemImageArray:[String] = ["house",  "cart", "plus.rectangle.on.folder", "person.crop.circle.badge.plus", "rectangle.portrait.arrowtriangle.2.outward"]
