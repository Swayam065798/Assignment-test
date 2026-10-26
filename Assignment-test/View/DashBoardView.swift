//
//  DashBoardView.swift
//  Assignment-test
//
//  Created by Swayam on 26/10/26.
//
import SwiftUI

struct DashBoardView: View {
    @StateObject var dashBoardVM: DashBoardVM = DashBoardVM()
    var body: some View {
        ZStack {
            if dashBoardVM.isLOading {
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
            } else if let error = dashBoardVM.errorMsg {
                VStack {
                    Image(systemName: "alert_icon")
                        .font(.system(size: 40))
                    Text("Something went wrong")
                        .font(.headline)
                    Text(error)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    Button("Retry All") {
                        Task {
                            await dashBoardVM.getAPIData()
                        }
                    }
                }
                .padding()
            } else {
                Text("Dashboard")
                    .font(.largeTitle)
            }
        }
        .task {
            await dashBoardVM.getAPIData()
        }
    }
}
