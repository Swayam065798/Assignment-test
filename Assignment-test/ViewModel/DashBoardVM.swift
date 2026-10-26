//
//  DashBoardVM.swift
//  Assignment-test
//
//  Created by Swayam on 26/10/26.
//

import Combine
import Foundation

@MainActor
final class DashBoardVM: ObservableObject {
    @Published var waetherDataResp: WeatherData?
    @Published var randomFactData: RandomFactData?
    @Published var dogImgData: DogImageData?
    @Published var isLOading: Bool = false
    @Published var errorMsg: String?

    func getVMAPIData() async {
        
        self.isLOading = true

        errorMsg = nil
        waetherDataResp = nil
        randomFactData = nil
        dogImgData = nil
        
        defer {
            isLOading = false
            
        }
        do {
            
            async let weatherdata: WeatherData = APIClient.getAPIData(
                url:
                    "https://api.open-meteo.com/v1/forecast?latitude=37.7749&longitude=-122.4194"
            )
            async let randomData: RandomFactData = APIClient.getAPIData(
                url: "https://uselessfacts.jsph.pl/api/v2/facts/random"
            )
            async let dogData: DogImageData = APIClient.getAPIData(
                url: "https://dog.ceo/api/breeds/image/random"
            )

            let (weatherResult, randomResult, dogResult) = try await (
                weatherdata, randomData, dogData
            )

            try Task.checkCancellation()
            
            waetherDataResp = weatherResult
            randomFactData = randomResult
            dogImgData = dogResult
            
        } catch {
            
            errorMsg = error.localizedDescription
        }
    }
}
