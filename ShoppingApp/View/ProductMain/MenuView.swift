//
//  MenuView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 09/10/20.
//

import SwiftUI

struct MenuView: View {
    @State private var scale: CGFloat = 1.0
    @State var index = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack(spacing: 15) {
                Image("p9")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .overlay(Circle().stroke(Color.gray.opacity(0.8), lineWidth: 1))
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading, spacing: 12){
                    Text("Jennifer Lopez")
                        .fontWeight(.bold)
                    Text("Castle Hill, New York, United States")
                    
                }
                .padding()
            }
            .padding(.bottom, 50)
            
            ForEach(scrollsTab.indices) { i in
                Button(action: {
                    self.index = i
                    if index == 4 {
                        UserDefaults.standard.removeObject(forKey: "isUserLoggin")
                        NotificationCenter.default.post(name: NSNotification.Name("isUserLoggin"), object: nil)
                        return
                    }
                }) {
                    HStack(alignment: .lastTextBaseline) {
                        Capsule()
                            .fill(self.index == i ? Color("placecolor") : Color.clear)
                            .frame(width: 5, height: 20)
                        Image(systemName: systemImageArray[i])
                            .foregroundColor(Color("placecolor"))
                            .frame(width: 30)
                            .offset(y: -5)
                        Text("\(drawerMenu[i])")
                            .padding(.leading)
                            .foregroundColor(.black)
                            .offset(y: -5)
                    }
                    .padding(.vertical, 5)
                }
            }
            Spacer()
        }
        .padding(.leading)
        .padding(.top)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
