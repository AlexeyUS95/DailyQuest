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
    private var keyboardType: UIKeyboardType = .default
    private var autocapitalization: TextInputAutocapitalization = .never

    @FocusState private var isFocused: Bool

    var shouldFloatPlaceholder: Bool {
        isFocused || !text.isEmpty
    }

    init(
        text: Binding<String>,
        errorMessage: Binding<String?>,
        placeholder: String,
        validation: ((String) -> String?)? = nil,
        keyboardType: UIKeyboardType = .default
    ) {
        self._text = text
        self._errorMessage = errorMessage
        self.placeholder = placeholder
        self.validation = validation
        self.keyboardType = keyboardType
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ZStack(alignment: .leading) {
                textField
                placeholderText
            }
            errorLabel
        }
        .onChange(of: isFocused) { _, newValue in
            if !newValue {
                validate()
            }
        }
    }

    @ViewBuilder private var placeholderText: some View {
        Text(placeholder)
            .padding(8)
            .foregroundStyle(Color.Colors.placeholder)
            .offset(y: shouldFloatPlaceholder ? -25 : 0)
            .scaleEffect(shouldFloatPlaceholder ? 0.7 : 1)
            .animation(.easeIn(duration: 0.1), value: shouldFloatPlaceholder)
    }

    @ViewBuilder private var textField: some View {
        TextField("", text: $text)
            .focused($isFocused)
            .padding(.horizontal, 16)
            .frame(height: 55)
            .background(Color.Colors.textFieldBackground)
            .cornerRadius(10)
            .textInputAutocapitalization(autocapitalization)
            .keyboardType(keyboardType)
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
