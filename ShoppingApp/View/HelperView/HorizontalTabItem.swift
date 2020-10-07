//
//  HorizontalTabItem.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 06/10/20.
//

import SwiftUI

struct HorizontalTabItem: View {
    var title: String
    @Binding var selectedTab: String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedTab = title
            }
        }){
            VStack(alignment: .leading, spacing: 4, content: {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)
                if selectedTab == title {
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 2)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            })
            
            .frame(width: 100)
        }
    }
}

//struct HorizontalTabItem_Previews: PreviewProvider {
//    static var previews: some View {
//        HorizontalTabItem()
//    }
//}
