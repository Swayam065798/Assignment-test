//
//  DashBoardVM.swift
//  Assignment-test
//
//  Created by Swayam on 26/10/26.
//

import Combine

class DashBoardVM: ObservableObject {
    @Published var waetherDataResp: WeatherData?
    @Published var randomFactData: RandomFactData?
    @Published var dogImgData: DogImageData?
}
