//
//  Modifiers.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import Foundation
import SwiftUI

struct MyTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.alphabet)
            .disableAutocorrection(true)
            .frame(height: 25)
            .padding(.all)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .submitLabel(.return)
    }
}

struct TitledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title)
            .fontWeight(.bold)
            .padding(.leading, 10)
    }
}

struct SubTitledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.gray)
            .padding(.leading, 10)
    }
}


