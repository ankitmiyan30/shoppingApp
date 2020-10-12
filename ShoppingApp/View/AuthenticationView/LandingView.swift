//
//  LandingView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 05/10/20.
//

import SwiftUI

struct LandingView: View {
    @State var show = false
    @State var showForPasswordPage = false
    @State var status = UserDefaults.standard.value(forKey: "isUserLoggin") as? Bool ?? false
    var body: some View {
        NavigationView {
            VStack{
                if self.status{
                    DashboardView(showDrawer: false)
                }
                else{
                    ZStack{
                        NavigationLink(destination: SignUpView(show: self.$show), isActive: self.$show) {
                            Text("")
                        }
                        .hidden()
                        NavigationLink(destination: ForgotPassword(showForPasswordPage: $showForPasswordPage), isActive: $showForPasswordPage){
                            Text("")
                        }
                        .hidden()
                        LoginView(show: self.$show, showForPasswordPage: $showForPasswordPage)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("isUserLoggin"), object: nil, queue: .main) { (_) in
                    self.status = UserDefaults.standard.value(forKey: "isUserLoggin") as? Bool ?? false
                }
            }
        }.accentColor(.red)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
