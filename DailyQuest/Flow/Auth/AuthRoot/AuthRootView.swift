//
//  AuthRootView.swift
//  DailyQuest
//
//  Created by mac on 22.04.2025.
//

import SwiftUI

struct AuthRootView: View {

    @StateObject var viewModel: AuthRootViewModel

    var body: some View {
        Button {
            viewModel.login()
        } label: {
            Text("Login")
        }
    }
}
