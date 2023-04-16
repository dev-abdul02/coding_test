//
//  CustomButton.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import SwiftUI

struct CustomButton: View {
    let title:String
    var buttonClicked:() -> ()
    var body: some View {
        Button(action: {
            buttonClicked()
        }, label: {
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
        })
        .buttonStyle(MyButtonStyle())

    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Sign up", buttonClicked: {})
    }
}

struct MyButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.body)
    }
}
