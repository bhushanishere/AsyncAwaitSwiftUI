//
//  CurrentDateListVirewModel.swift
//  AsyncAwaitSwiftUI
//
//  Created by Bhushan Borse DXC on 05/06/24.
//

import Foundation

@MainActor
class CurrentDateListViewModel : ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async{
        do {
            let currentDate = try await WebService().getDate()
        
            if let currentDate = currentDate {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                self.currentDates.append(currentDateViewModel)
            }
        } catch {
            print("Error ->", error.localizedDescription)
        }
    }
}

struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
