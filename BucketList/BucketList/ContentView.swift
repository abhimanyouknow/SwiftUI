//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success..")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failure...")
    }
}

struct ContentView: View {
    enum LoadingState {
        case loading, success, failure
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failure:
            FailureView()
        }
        
        /* we could also have used an if-else block -
         
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failure {
            FailureView()
        }
         */
    }
}

#Preview {
    ContentView()
}
