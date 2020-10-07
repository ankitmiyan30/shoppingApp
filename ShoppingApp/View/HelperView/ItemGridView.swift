//
//  ItemGridView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 06/10/20.
//

import SwiftUI

struct ItemGridView: View {
    var dressObject: DressModel
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            
            ZStack{
                
                Color(dressObject.image)
                    .cornerRadius(15)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }){
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(dressObject.isFav ? .red : .gray)
                                .font(.title2)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.gray,radius: 4)
                        }
                    }
                    .padding()
                    Spacer(minLength: 0)
                    Image(dressObject.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .matchedGeometryEffect(id: dressObject.image, in: animation)
                }
            }
            
            Text(dressObject.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
//                .padding(.horizontal, 10)
            Text(dressObject.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
//                .padding(.horizontal, 10)
            
        })
    }
}

//struct ItemGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemGridView()
//    }
//}
