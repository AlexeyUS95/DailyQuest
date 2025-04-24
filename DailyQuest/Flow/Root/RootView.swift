//
//  ContentView.swift
//  DailyQuest
//
//  Created by mac on 20.04.2025.
//

import SwiftUI

struct RootView: View {

    @StateObject var viewModel: RootViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            bodyView
        }
        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea(.container, edges: .vertical)
    }

    @ViewBuilder private var bodyView: some View {
        switch viewModel.state {
        case .notAuthorized:
            CoordinatorUIController<UINavigationController>(coordinator: viewModel.authCoordinator)
        case .authorized:
            CoordinatorUIController<UINavigationController>(coordinator: viewModel.appCoordinator)
        }
    }
}

#Preview {
    RootView(
        viewModel: RootView.RootViewModel(
            diContainer: .preview
        )
    )
}
