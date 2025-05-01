//
//  CustomTextField.swift
//  DailyQuest
//
//  Created by mac on 01.05.2025.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var text: String

    private var placeholder: String

    init(
        text: Binding<String>,
        placeholder: String
    ) {
        self._text = text
        self.placeholder = placeholder
    }

    var body: some View {
        TextField(text: $text) {
            Text(placeholder)
                .foregroundStyle(Color.Colors.placeholder)
        }
        .padding(.horizontal, 16)
        .frame(height: 50)
        .background(Color.Colors.textFieldBackground)
        .cornerRadius(10)
    }
}

#Preview {
    CustomTextField(text: .constant(""), placeholder: "Email")
        .padding(16)
}
