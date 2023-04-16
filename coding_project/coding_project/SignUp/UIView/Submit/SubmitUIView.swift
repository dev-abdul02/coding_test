//
//  ContentView.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import SwiftUI

struct SubmitUIView: View {

    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView() {
        VStack(alignment: .leading,  spacing: APP_SPACING) {
            Text(SUBMIT_TITLE)
                .modifier(TitledModifier())
            
            Text(SUBMIT_SUB_TITLE)
                .modifier(SubTitledModifier())
            
            CustomAvatar(callback: { img in
                viewModel.user.image = img
            })
            .padding(.all)
            
            TextField(FNAME, text: $viewModel.user.fname)
                .modifier(MyTextFieldModifier())
            TextField(EMAIL, text: $viewModel.user.email)
                .modifier(MyTextFieldModifier())
                .keyboardType(.emailAddress)
            PasswordTextField(showPassword: false, text: $viewModel.user.password)
            TextField(WEBSITE, text: $viewModel.user.website)
                .modifier(MyTextFieldModifier())
                .keyboardType(.URL)
            
            
            CustomButton(title: SUBMIT, buttonClicked: {
                viewModel.checkEmptyField()
            })
            
            NavigationLink(destination: SignInUIView(user: viewModel.user), isActive: $viewModel.movetoSigninPage) {}
            
            
            
        }
        .padding()
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitUIView()
    }
}
