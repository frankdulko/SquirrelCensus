//
//  SquirrelModel.swift
//  SquirrelCensus
//
//  Created by Frank Dulko on 7/24/24.
//

import Foundation
import Combine

enum Shift {
    case am, pm
}

enum Age {
    case adult, juvenile
}

enum FurColor {
    case gray, cinnamon, black
}

enum Location {
    case groundPlane, aboveGround
}

struct Squirrel : Identifiable, Decodable{
    let long: String
    let lat: String
    let id: String
    let shift: String?
    let date: String?
    let age: String?
    let primaryFurColor: String?
    let highlightFurColor: String?
    let locationNotes: String?
    
    enum CodingKeys: String, CodingKey {
        case long = "x"
        case lat = "y"
        case id = "unique_squirrel_id"
        case primaryFurColor = "primary_fur_color"
        case highlightFurColor = "highlight_fur_color"
        case locationNotes = "specific_location"
        case shift, date, age
    }
}

class SquirrelModel : ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    @Published var squirrels : [Squirrel] = [];
    @Published var isLoading : Bool = false;

    
    func getSquirrelData(){
        print("~~~ getting squirrel data");
        self.isLoading = true
        let url = URL(string: "https://data.cityofnewyork.us/resource/vfnx-vebw.json?$limit=50&$offset=0")!
        URLSession.shared.fetchSquirrelData(at: url).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { squirrels in
                self.squirrels = squirrels
                print("~~~ got squirrels")
                print(self.squirrels.count)
            }
            .store(in: &cancellables)
//        URLSession.shared.fetchSquirrelData(at: url) {result in switch result {
//        case .success(let squirrels):
//            self.squirrels = squirrels;
//            self.gotSquirrels = true;
//            print("~~~ got squirrels")
//            print(self.squirrels.count)
//            break
//        case .failure(let error):
//            print(error)
//            break
//        }
//
//        }
//        self.isLoading = false;
        squirrels.append(Squirrel(long: "", lat: "", id: "", shift: "", date: "", age: "", primaryFurColor: "", highlightFurColor: "", locationNotes: ""))
    }
}
