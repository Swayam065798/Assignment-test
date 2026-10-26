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
            } else if let weather = dashBoardVM.waetherDataResp,
                let fact = dashBoardVM.randomFactData,
                let dog = dashBoardVM.dogImgData
            {

                VStack(alignment: .leading, spacing: 16) {
                    Text("Dashboard")
                        .font(.largeTitle)
                    Text("Weather Details")
                        .font(.headline)
                    Text("Latitude: \(weather.latitude)")
                    Text("Longitude: \(weather.longitude)")
                    Divider()
                    Text("Random Fact")
                        .font(.headline)
                    Text(fact.text)
                    Divider()
                    Text("Dog Image URL")
                        .font(.headline)
                    Text(dog.message)
                        .font(.caption)
                }
                .padding()
            } else {
                Text("No data available")
            }
        }
        .task {
            await dashBoardVM.getAPIData()
        }
    }
}
