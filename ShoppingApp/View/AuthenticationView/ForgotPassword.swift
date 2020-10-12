//
//  ForgotPassword.swift
//  ShoppingApp
//
//  Created by Anthony Ankit on 05/10/20.
//

import SwiftUI
import Firebase
struct ForgotPassword: View {
    @Binding var showForPasswordPage: Bool
    @State var email = ""
    @State var color = Color.black.opacity(0.7)
    var body: some View {
        VStack {
            ZStack {
                GeometryReader{_ in
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    VStack {
                        Image("applogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(20)
                        Text("Enter your registered email address")
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email == "" ? Color.red : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        Button(action: {
                            self.resetPassword()
                        }) {
                            
                            Text("Reset Password")
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
            .navigationBarBackButtonHidden(false)
        }
    }
    
    func resetPassword(){
        if !ShoppingHelper.validateUser(email) {
            ShoppingHelper.simpleSnackBar("Enter valid email address.", duration: .long)
            return
        }
        sendResetLink()
    }
    func sendResetLink(){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                ShoppingHelper.simpleSnackBar(error?.localizedDescription ?? "Failed to send reset link, please check given email address.", duration: .long)
            } else {
                ShoppingHelper.simpleSnackBar(error?.localizedDescription ?? "Reset password link sent to your email address.", duration: .long)
                self.showForPasswordPage.toggle()
            }
        }
    }
}
//
//struct ForgotPassword_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgotPassword()
//    }
//}
