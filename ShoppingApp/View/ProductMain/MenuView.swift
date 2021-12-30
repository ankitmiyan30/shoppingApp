//
//  MenuView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 09/10/20.
//

import SwiftUI

struct MenuView: View {
    @State private var scale: CGFloat = 1.0
    @State var showAddToCart = false
    @State var showAboutUs = false
    @State var showContactUs = false
    @State var index = 0
    @Binding var showDrawer: Bool
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
            
            ForEach(drawerMenu.indices) { i in
                Button(action: {
                    self.drawerMenuItemClick(index: i)
                    
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
        NavigationLink(destination: AddToCartView(), isActive: self.$showAddToCart) {
            Text("")
        }.hidden()
        .transition(.move(edge: .bottom))
        .animation(.easeInOut)
        NavigationLink(destination: AboutUs(), isActive: self.$showAboutUs) {
            Text("")
        }.hidden()
        NavigationLink(destination: ContactUs(), isActive: self.$showContactUs) {
            Text("")
        }.hidden()
    }
    
    func drawerMenuItemClick(index: Int) {
        self.index = index
        if index == 0 {
            withAnimation(.spring()){
                self.showDrawer.toggle()
                self.index = 0
            }
        }
        if index == 1 {
            withAnimation(.spring()){
                self.showAddToCart.toggle()
                self.index = 0
                self.showDrawer.toggle()
            }
        }
        if index == 2 {
            withAnimation(.spring()){
                self.showDrawer.toggle()
                self.showAboutUs.toggle()
                self.index = 0
            }
        }
        if index == 3 {
            withAnimation(.spring()){
                self.showDrawer.toggle()
                self.showContactUs.toggle()
                self.index = 0
            }
        }
        if index == 4 {
            UserDefaults.standard.removeObject(forKey: "isUserLoggin")
            NotificationCenter.default.post(name: NSNotification.Name("isUserLoggin"), object: nil)
            self.index = 0
            return
        }
    }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
