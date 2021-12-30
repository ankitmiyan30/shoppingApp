//
//  DashboardView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 05/10/20.
//

import SwiftUI
import Firebase
import TTGSnackbar
struct DashboardView: View {
    @State var index = ""
    @State var showDrawer:Bool
    var body : some View {
        ZStack {
            (self.showDrawer ? Color("p1").opacity(0.7) : Color.clear ).edgesIgnoringSafeArea(.all)
            ZStack(alignment: .leading){
                //Draser menu view
                MenuView(showDrawer: $showDrawer)
            }
            ZStack(alignment: .topTrailing){
                MainView(showDrawer: $showDrawer)
                    .scaleEffect(self.showDrawer ? 0.8 : 1)
                    .offset(x: self.showDrawer ? 170 : 0, y: self.showDrawer ? 50 : 0)
                    .disabled(self.showDrawer ? true : false)
                
                Button(action: {
                    withAnimation(.spring()){
                        self.showDrawer.toggle()
                    }
                }){
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                .padding()
                .opacity(self.showDrawer ? 1 : 0)
            }
            
            
        }
        
        
        
    }
}
struct MainView: View {
    @State var selectedTab = scrollsTab[0]
    @State var index = 0
    @State var selectedDress: DressModel!
//    @State var tabWiseModel:[DressModel]!
    @State var showDetails = false
    @State var showAddToCart = false
    @State private var searchText = ""
    
    
    @Namespace var animation
    
    @Binding var showDrawer : Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: DressDetailView(dressModel: $selectedDress, animation: animation), isActive: self.$showDetails) {
                    Text("")
                }.hidden()
                NavigationLink(destination: AddToCartView(), isActive: self.$showAddToCart) {
                    Text("")
                }.hidden()
                VStack (spacing: 0){
                    ZStack {
                        HStack(spacing: 15){
                            Button(action:{
                                withAnimation(.spring()){
                                    showDrawer.toggle()
                                }
                            }){
                                Image(systemName: "line.horizontal.3.decrease")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
//                            Button(action:{
//
//                            }){
//                                Image(systemName: "magnifyingglass")
//                                    .font(.title)
//                                    .foregroundColor(.white)
//                            }
                            
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                                Button(action:{
                                    showAddToCart.toggle()
                                }){
                                    Image(systemName: "cart")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 20, height: 20)
                                        .offset(x:5, y: -10)
                                    
                                    Text("1")
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 12))
                                        .offset(x:5, y: -10)
                                }
                            })
                        }
                        
                        Text("MyShop")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color("p1").ignoresSafeArea(.all, edges: .top))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            SearchBar(text: $searchText)
                            HStack{
                                Text(selectedTab)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: 15) {
                                    ForEachWithIndex(scrollsTab, id: \.self) { position ,tab in
                                        HorizontalTabItem(title: tab, index: position, selectedTab: $selectedTab, selectedIndex: $index, animation: animation)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top,10)
                            })
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 2),spacing: 15){
                                ForEach(arrayOfDressModels[index].filter({searchText.isEmpty ? true : $0.title.contains(searchText)})){dress in
                                    ItemGridView(dressObject: dress,animation: animation).onTapGesture {
                                        withAnimation(.easeIn) {
                                            selectedDress = dress
                                            showDetails.toggle()
                                        }
                                    }
                                }
                            }
                            .padding()
                            .padding(.top,10)
                        }
                    })
                }
                .background(Color.white.ignoresSafeArea(.all, edges: .all))
            }
            .ignoresSafeArea(.all, edges: .top)
            .navigationTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        
    }
    
    
}



//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}






public struct ForEachWithIndex<Data: RandomAccessCollection, ID: Hashable, Content: View>: View {
    public var data: Data
    public var content: (_ index: Data.Index, _ element: Data.Element) -> Content
    var id: KeyPath<Data.Element, ID>

    public init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (_ index: Data.Index, _ element: Data.Element) -> Content) {
        self.data = data
        self.id = id
        self.content = content
    }

    public var body: some View {
        ForEach(
            zip(self.data.indices, self.data).map { index, element in
                IndexInfo(
                    index: index,
                    id: self.id,
                    element: element
                )
            },
            id: \.elementID
        ) { indexInfo in
            self.content(indexInfo.index, indexInfo.element)
        }
    }
}

extension ForEachWithIndex where ID == Data.Element.ID, Content: View, Data.Element: Identifiable {
    public init(_ data: Data, @ViewBuilder content: @escaping (_ index: Data.Index, _ element: Data.Element) -> Content) {
        self.init(data, id: \.id, content: content)
    }
}

extension ForEachWithIndex: DynamicViewContent where Content: View {
}

private struct IndexInfo<Index, Element, ID: Hashable>: Hashable {
    let index: Index
    let id: KeyPath<Element, ID>
    let element: Element

    var elementID: ID {
        self.element[keyPath: self.id]
    }

    static func == (_ lhs: IndexInfo, _ rhs: IndexInfo) -> Bool {
        lhs.elementID == rhs.elementID
    }

    func hash(into hasher: inout Hasher) {
        self.elementID.hash(into: &hasher)
    }
}
