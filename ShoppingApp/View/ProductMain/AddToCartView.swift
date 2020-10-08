//
//  DummyFile.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 07/10/20.
//

import SwiftUI

struct AddToCartView: View {
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
                    Text("My Cart")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color("p1").ignoresSafeArea(.all, edges: .top))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    VStack{
                        HStack(spacing: 6){
                            VStack(alignment: .leading, spacing: 8) {
                                HStack{
                                    Text("Delivery to Ankit Singh Pune ")
                                        .lineLimit(1)
                                        .frame(alignment: .leading)
                                    Button(action: {
                                        
                                    }){
                                        Text("WORK")
                                            .fontWeight(.light)
                                            .padding(.vertical, 3)
                                            .padding(.horizontal, 12)
                                            .foregroundColor(Color.gray)
                                            .background(Color.gray.opacity(0.1))
                                    }
                                    .clipShape(Capsule())
                                }
                                Text("Delivery to Ankit Singh, 1324234fdfsdfjkh")
                                    .lineLimit(1)
                                    .foregroundColor(.gray)
                                    
                            }
                            
                            Spacer( minLength: 0)
                            
                            Button(action: {
                                
                            }){
                                Text("Change")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 12)
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .font(.title3)
                            }
                            .border(Color.gray.opacity(0.5), width: 0.5)
                            .shadow(color: Color.gray.opacity(0.5), radius: 0.5, x: 0, y: 0.0)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    ForEach(0..<2, id: \.self) { tab in
                        CartItemTilesView().padding(.top, 4)
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("PRICE DETAILS")
                            .lineLimit(1)
                            .foregroundColor(.gray)
                            .frame(alignment: .leading)
                            .padding(.leading, 16)
                        Divider()
                            .background(Color.gray)
                        VStack(alignment: .leading, spacing: 16) {
                            HStack{
                                Text("Price (2 Items)")
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                                Spacer()
                                Text("$2000")
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                            }
                            HStack{
                                Text("Discount")
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                                Spacer()
                                Text("-$600")
                                    .lineLimit(1)
                                    .foregroundColor(.green)
                            }
                            HStack{
                                Text("Delivery Charges")
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                                Spacer()
                                Text("FREE")
                                    .lineLimit(1)
                                    .foregroundColor(.green)
                            }
                            Divider()
                                .background(Color.gray)
                            HStack{
                                Text("Total Amount")
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                                    
                                Spacer()
                                Text("$1400")
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding()
                        .border(Color.gray.opacity(0.4), width: 0.5)
                        Divider()
                            .background(Color.gray)
                        Text("You will save $600 on this order")
                            .lineLimit(1)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                        
                        
                    }
                    .padding(.vertical)
                    .background(Color.white)
                    .border(Color.gray.opacity(0.4), width: 0.5)
                    
                    
                })
                .padding(.top, -10)
                Spacer()
                HStack {
                    VStack (alignment: .leading, spacing: 8){
                        Text("$1400")
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .padding(.top, 4)
                        Text("View price details")
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                    }
                    
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("Place Order")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 20)
                            
                    }
                    .background(Color("placecolor"))
                    .cornerRadius(2)
                    
                }
                .padding(.horizontal)
                .background(Color.white)
                .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 100)
                
            }
            .edgesIgnoringSafeArea([.top, .bottom])
            .background(Color.gray.opacity(0.2).ignoresSafeArea(.all, edges: .top))
            .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        }
        
    }
}

struct DummyFile_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView()
    }
}
