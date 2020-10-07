//
//  SignUpView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 05/10/20.
//

import SwiftUI
import Firebase
import TTGSnackbar

struct SignUpView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var error = ""
    
    var body: some View{
        ZStack{
            ZStack(alignment: .topLeading) {
                GeometryReader{_ in
                    VStack{
                        Image("applogo")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        
                        Text("Log in to your account")
//                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email == "" ? Color.red : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                                else{
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass == "" ? Color.red : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        HStack(spacing: 15){
                            VStack{
                                if self.revisible{
                                    TextField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                                else{
                                    SecureField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                            }
                            Button(action: {
                                self.revisible.toggle()
                            }) {
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass == "" ? Color.red : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        Button(action: {
                            self.registerUser()
                        }) {
                            Text("Register")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(LinearGradient(gradient: .init(colors: [Color.green, Color.red, Color.gray]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
            }
        }
        .foregroundColor(.red)
        .accentColor(.red)
//        .navigationBarBackButtonHidden(true)
    }
    
    func validateUser()-> Bool{
        if !ShoppingHelper.validateUser(email) {
            ShoppingHelper.simpleSnackBar("Enter valid email address.", duration: .long)
            return false
        }
        if pass == "" || repass == "" {
            ShoppingHelper.simpleSnackBar("Please enter password.", duration: .short)
            return false
        }
        if pass != repass {
            ShoppingHelper.simpleSnackBar("Password doesn't match.", duration: .long)
            return false
        }
        return true
    }
    
    func registerUser(){
        if validateUser() {
            Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
                if err != nil{
                    ShoppingHelper.simpleSnackBar(err?.localizedDescription ?? "User not created", duration: .long)
                    return
                }
                UserDefaults.standard.set(true, forKey: "isUserLoggin")
                NotificationCenter.default.post(name: NSNotification.Name("isUserLoggin"), object: nil)
            }
        }
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
