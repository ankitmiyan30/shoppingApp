//
//  DummyFile.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 07/10/20.
//

import SwiftUI

struct AddToCartView: View {
    @Binding var showAddToCart:Bool
    var body: some View {
        VStack {
            HStack (spacing: 20){
                Button(action:{
                    showAddToCart.toggle()
                }){
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                }
                Text("My Cart")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            Spacer()
            VStack {
                Image("p1")
                    .resizable()
            }
        }
    }
}

//struct DummyFile_Previews: PreviewProvider {
//    static var previews: some View {
//        AddToCartView()
//    }
//}
