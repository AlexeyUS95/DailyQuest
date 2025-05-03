//
//  CustomTextField.swift
//  DailyQuest
//
//  Created by mac on 01.05.2025.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var text: String
    @Binding var errorMessage: String?

    private var placeholder: String
    private var validation: ((String) -> String?)?

    @FocusState private var isFocused: Bool

    init(
        text: Binding<String>,
        errorMessage: Binding<String?>,
        placeholder: String,
        validation: ((String) -> String?)? = nil
    ) {
        self._text = text
        self._errorMessage = errorMessage
        self.placeholder = placeholder
        self.validation = validation
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            textField
            errorLabel
        }
        .onChange(of: isFocused) { _, newValue in
            if !newValue {
                validate()
            }
        }
    }

    @ViewBuilder private var textField: some View {
        TextField(text: $text) {
            Text(placeholder)
                .foregroundStyle(Color.Colors.placeholder)
        }
        .focused($isFocused)
        .padding(.horizontal, 16)
        .frame(height: 50)
        .background(Color.Colors.textFieldBackground)
        .cornerRadius(10)
    }

    @ViewBuilder var errorLabel: some View {
        if let errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
                .font(UIFont.subtitle.font())
                .padding(.leading, 16)
        }
    }

    private func validate() {
        if let validation = validation {
            errorMessage = validation(text)
        }
    }
}

#Preview {
    CustomTextField(
        text: .constant(""),
        errorMessage: .constant("must contain @ character"),
        placeholder: "Email"
    )
    .padding(16)
}
