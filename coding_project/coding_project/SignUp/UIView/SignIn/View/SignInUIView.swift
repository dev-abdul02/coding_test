//
//  SignInUIView.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import SwiftUI

struct SignInUIView: View {
    
    var user:UserModel
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Spacer()
                .frame(height: 50)
            Text(SIGN_IN_TITLE + user.fname)
                .modifier(TitledModifier())

            Text(SIGN_IN_SUBTITLE)
                .modifier(SubTitledModifier())

            Image(uiImage: user.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)
                .cornerRadius(10)

            Group {
                Text(user.website)
                Text(user.fname)
                Text(user.email)
            }
            Spacer()
            
            CustomButton(title: SUBMIT, buttonClicked: {

            })
            
        }
        .padding(.all)
        .navigationBarHidden(true)

    }
}

struct SignInUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignInUIView(user: UserModel(fname: "", email: "", website: "", password: ""))
    }
}
