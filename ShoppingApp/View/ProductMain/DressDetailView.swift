//
//  DressDetailView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 06/10/20.
//

import SwiftUI

struct DressDetailView: View {
    @Binding var dressModel : DressModel!
    //    @Binding var show: Bool
    var animation: Namespace.ID
    @State var selectedColor = Color.white
    @State var count = 1
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            NavigationView {
                Text("")
            }.navigationTitle("")
            .navigationBarHidden(true)
            VStack {
                HStack {
                    VStack(alignment: .leading,spacing: 5){
                        Button(action: {
                            withAnimation(.easeOut){self.presentationMode.wrappedValue.dismiss()}
                        }) {
                            
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                        Text("Summer Sale")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top)
                        
                        Text(dressModel.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }){
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 20, height: 20)
                            .offset(x:-12, y: -10)
                            .shadow(color: Color.gray,radius: 4)
                        
                        Text("1")
                            .foregroundColor(.white)
                            .font(Font.system(size: 12))
                            .offset(x:-12, y: -10)
                    }
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                HStack(spacing: 10) {
                    VStack {
                        Text("Price")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text(dressModel.price)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                    }
                    Image(dressModel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: dressModel.image, in: animation)
                    
                }
                .padding()
                .padding(.top, 10)
                .zIndex(1)
                
                VStack{
                    ScrollView(isSmallDevice ? .vertical : .init(), showsIndicators: false){
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Color")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                HStack {
                                    ColorButton(color: Color(dressModel.image), selectedColor: $selectedColor)
                                    ColorButton(color: Color.yellow, selectedColor: $selectedColor)
                                    ColorButton(color: Color.green, selectedColor: $selectedColor)
                                }
                            }
                            Spacer(minLength: 0)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Size")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                Text("M")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
//                        .padding(.top, isSmallDevice ? 0 : -20)
                        
                        Text("Cloth is fabric which is made by weaving or knitting a substance such as cotton, wool, silk, or nylon. Cloth is used especially for making clothes. ... A cloth is a piece of cloth which you use for a particular purpose, such as cleaning something or covering something")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        HStack(spacing: 20){
                            Button(action: {
                                if count != 1 {
                                    count -= 1
                                }
                            }){
                                Image(systemName: "minus")
                                    .foregroundColor(.gray)
                                    .font(.title2)
                                    .frame(width: 35, height: 35)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            }
                            
                            Text("\(count)")
                                .font(.title2)
                            
                            Button(action: {
                                count += 1
                            }){
                                Image(systemName: "plus")
                                    .foregroundColor(.gray)
                                    .font(.title2)
                                    .frame(width: 35, height: 35)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                dressModel.isFav.toggle()
                            }){
                                Image(systemName: "suit.heart.fill")
                                    .foregroundColor(dressModel.isFav ? .red : .gray)
                                    .font(.title2)
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(color: Color.gray,radius: 4)
                            }
                        }
                        .padding(.horizontal)
                        Spacer(minLength: 0)
                        Button (action: {
                            
                        }){
                            Text("BUY")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 32)
                                .background(selectedColor)
                                .clipShape(Capsule())
                        }
                        .padding(.top)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 10)
                    }
                }
                .background(
                    Color.white
                        .clipShape(CustomCorner())
                        .padding(.top, isSmallDevice ? -60 : -100))
                .zIndex(0)
                .padding(.top, 20)
                
            }
            .background(selectedColor.ignoresSafeArea(.all, edges: .top))
            .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
            .edgesIgnoringSafeArea([.top, .bottom])
            .onAppear{
                selectedColor = Color(dressModel.image)
            }
        }
    }
}


