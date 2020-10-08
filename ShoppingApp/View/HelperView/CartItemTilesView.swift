//
//  CartItemTilesView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 08/10/20.
//

import SwiftUI

struct CartItemTilesView: View {
    //    var dressObject: DressModel
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack(alignment: .top,spacing: 8){
                    VStack(alignment: .leading, spacing: 4) {
                        Text("HAREET Lightweight Dress")
                            .lineLimit(1)
                            .frame(alignment: .leading)
                        Text("Size: M, White, Black")
                            .lineLimit(1)
                            .foregroundColor(.gray)
                        
                        HStack{
                            Text("Seller: Wadhwa Dresses Company ")
                                .lineLimit(1)
                                .foregroundColor(.gray)
                            Button(action: {
                                
                            }){
                                Image("flipkartassured")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 20)
                            }
                        }
                        
                        
                    }
                    
                    Spacer( minLength: 0)
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding(0)
                }
                HStack {
                    Group{
                        Text("$ 700")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("$ 1000")
                            .foregroundColor(.gray)
                            .strikethrough()
                        Text("30% off")
                            .foregroundColor(.green)
                    }
                    Spacer()
                    //                    HStack {
                    Button(action: {
                        
                    }){
                        Text("Qty: 1")
                            .padding(.vertical, 4)
                            .padding(.horizontal, 16)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .font(.title3)
                        Image(systemName: "arrowtriangle.down.fill")
                            .padding(.trailing, 8)
                            .foregroundColor(.black)
                    }
                    .border(Color.gray.opacity(0.5), width: 0.5)
                    .shadow(color: Color.gray.opacity(0.5), radius: 0.5, x: 0, y: 0.0)
                    .frame(width: 120, height: 30)
                    //                    }
                    
                }
                Text("2 offers applied , 2 offers available")
                    .padding(.top, 8)
                    .foregroundColor(.green)
                HStack {
                    Group{
                        Text("Delevery by Mon Oct 12  | ")
                            .foregroundColor(.black)
                        
                        Text("Free")
                            .foregroundColor(.green)
                        
                        Text("$5")
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                }
                .padding(.top, 8)
            }
            .padding()
            Divider()
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .foregroundColor(.gray)
                        .offset(x: 0, y: -2)
                    Text("Save for later")
                        .fixedSize()
                        .foregroundColor(.black)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Divider() // or Rectangle().fill(Color.gray).frame(width: 1)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.gray)
                        .offset(x: 0, y: -1)
                    Text("Remove")
                        .fixedSize()
                        .foregroundColor(.black)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.vertical)
        .background(Color.white)
        .border(Color.gray.opacity(0.4), width: 0.5)
    }
}

struct CartItemTilesView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemTilesView()
    }
}
