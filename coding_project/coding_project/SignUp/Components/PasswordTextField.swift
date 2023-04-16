//
//  PasswordTextField.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import Foundation
import SwiftUI

struct PasswordTextField: View {
    @State var showPassword:Bool = false
    @Binding var text:String
    @FocusState var inFocus: Field?

    enum Field {
        case secure, plain
    }
    
    var body: some View {
        ZStack {
            if showPassword {
                TextField(PASSWORD, text: $text)
                    .keyboardType(.alphabet)
                    .disableAutocorrection(true)
                    .focused($inFocus, equals: .plain)
                    .frame(height: 25)
                    .padding(.all)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .submitLabel(.return)
                
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.gray.opacity(0.8))
                    .offset(x: 0.38*UIScreen.screenWidth)
                    .frame(width: 44, height: 40)
                    .onTapGesture {
                        showPassword.toggle()
                        inFocus = showPassword ? .plain : .secure
                    }
            }
            else {
                SecureField(PASSWORD, text: $text)
                    .autocorrectionDisabled()
                    .keyboardType(.default)
                    .focused($inFocus, equals: .secure)
                    .frame(height: 25)
                    .padding(.all)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .submitLabel(.return)
                
                Image(systemName: "eye.fill")
                    .foregroundColor(.gray.opacity(0.8))
                    .offset(x: 0.38*UIScreen.screenWidth)
                    .frame(width: 44, height: 40)
                    .onTapGesture {
                        showPassword.toggle()
                        inFocus = showPassword ? .plain : .secure
                    }
            }
        }
    }
}
