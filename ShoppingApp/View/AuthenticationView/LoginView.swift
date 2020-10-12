//
//  LoginView.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 05/10/20.
//

import SwiftUI
import Firebase
struct LoginView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var error = ""
    @Binding var show : Bool
    @Binding var showForPasswordPage: Bool
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing ){
                GeometryReader {_ in
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                        VStack {
                            Image("applogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                            
                            
                            Text("Login in to your account")
                                //                            .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(self.color)
                                .padding(.top, 35)
                            
                            TextField("Email", text: self.$email)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email == "" ? Color.red : self.color,lineWidth: 2))
                                .padding(.top, 25)
                            
                            HStack {
                                VStack {
                                    if visible {
                                        TextField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    } else {
                                        SecureField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    }
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }){
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass == "" ? Color.red : self.color,lineWidth: 2))
                            .padding(.top, 25)
                            
                            HStack{
                                Spacer()
                                Button(action: {
                                    self.showForPasswordPage.toggle()
                                }) {
                                    Text("Forget password?")
                                        .fontWeight(.bold)
                                        .foregroundColor(self.color)
                                }
                            }
                            .padding(.top, 20)
                            Button(action: {
                                self.loginUser()
                            }){
                                Text("Log In")
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
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                }
                .padding()
            }
        }
    }
    
    func validateUser()-> Bool{
        if !ShoppingHelper.validateUser(email) {
            ShoppingHelper.simpleSnackBar("Enter valid email address.", duration: .long)
            return false
        }
        if pass == "" {
            ShoppingHelper.simpleSnackBar("Please enter password.", duration: .short)
            return false
        }
        return true
    }
    
    func loginUser(){
        if validateUser() {
            Auth.auth().signIn(withEmail: email, password: pass) { (res, err) in
                if err != nil{
                    ShoppingHelper.simpleSnackBar(err?.localizedDescription ?? "User Login Failed", duration: .long)
                    return
                }
                UserDefaults.standard.set(true, forKey: "isUserLoggin")
                NotificationCenter.default.post(name: NSNotification.Name("isUserLoggin"), object: nil)
            }
        }
    }
    
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
