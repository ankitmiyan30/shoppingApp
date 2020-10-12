//
//  AboutUs.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 09/10/20.
//

import SwiftUI

struct AboutUs: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color.red
            NavigationView {
                Text("")
            }.navigationTitle("")
            .navigationBarHidden(true)
            VStack {
                HStack (spacing: 20){
                    Button(action:{
                        withAnimation(.easeOut){self.presentationMode.wrappedValue.dismiss()}
                    }){
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Text("About Us")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color("p1").ignoresSafeArea(.all, edges: .top))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                Spacer()
            }
            .edgesIgnoringSafeArea([.top, .bottom])
            .background(Color.gray.opacity(0.2).ignoresSafeArea(.all, edges: .top))
            .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
